import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';

class ApiClient {
  //dio instance
  final Dio _dio = Dio()
    ..options.baseUrl = AppConstants.baseUrl
    ..options.receiveDataWhenStatusError = true
    ..options.connectTimeout =
        const Duration(milliseconds: AppConstants.connectionTimeout)
    ..options.receiveTimeout =
        const Duration(milliseconds: AppConstants.receiveTimeout)
    ..options.responseType = ResponseType.json
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  // ..httpClientAdapter = BrowserHttpClientAdapter();

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }
}

// class ApiInterceptors extends Interceptor {
//   @override
//   Future<dynamic> onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // do something before request is sent

//     Map<String, String> headers = {
//       "x-request-time": "",
//       "x-app-version": "",
//       "x-device-fingerprint": "",
//       // "x-request-signature": "",
//     };
//   }

//   @override
//   Future<dynamic> onResponse(
//       Response response, ResponseInterceptorHandler handler) async {
//     // do something before response
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     // do something to error
//   }
// }
