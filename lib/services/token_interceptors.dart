import 'package:dio/dio.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';

HiveService _hiveService = locator<HiveService>();
ApiService _apiService = locator<ApiService>();

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor({required this.dio});

  // This method adds the JWT header to every request.
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _hiveService.retrieveData(kUserBox, kJwtTokenKey);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Optionally handle errors retrieving token.
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Check if the response status code is 401 (and avoid intercepting the token refresh call itself)
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != AppConstants.tokenEndpoint) {
      try {
        final username =
            await _hiveService.retrieveData(kUserBox, kUsernameKey);
        final hash = await _hiveService.retrieveData(kUserBox, kHashKey);

        // Generate new JWT by calling your API service
        final tokenResponse = await _apiService.getJwt(
          username: username,
          hash: hash,
        );
        final newToken =
            tokenResponse.data!.jwt; // Ensure this is the token string

        // Update Hive with the new token
        await _hiveService.storeData(kUserBox, kJwtTokenKey, newToken);

        // Update the headers of the original request with the new token
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        // Create a new request using the updated headers
        final options = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        );

        final cloneResponse = await dio.request(
          err.requestOptions.path,
          options: options,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        // Resolve the new response
        return handler.resolve(cloneResponse);
      } catch (e) {
        // If refreshing the token fails, reject the error
        return handler.reject(err);
      }
    }
    // For all other errors, pass them through
    return handler.next(err);
  }
}
