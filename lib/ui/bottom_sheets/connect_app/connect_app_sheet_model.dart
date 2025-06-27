import 'package:flutter/widgets.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/models/google_sign.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/authorization_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConnectAppSheetModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final AuthorizationService _authService = locator<AuthorizationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  ConnectAppSheetModel({required this.userId});

  String? userId;

  Future<void> connectApp(AuthProvider provider) async {
    String appId = provider.name;
    String urlEndPoint = _getAuthUrlEndpoint(provider);

    try {
      SignAuth signAuth = await _apiService.getAppAuthUrl(
        appId: appId,
        userId: userId!,
        urlEndPoint: urlEndPoint,
      );

      await _authService.authenticate(signAuth.data.link);

      _bottomSheetService.completeSheet(SheetResponse(
        confirmed: true,
      ));
    } catch (e) {
      debugPrint("Error during authentication: $e");
    }
  }

  String _getAuthUrlEndpoint(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.google:
        return AppConstants.googleEndpoint;
      case AuthProvider.x:
        return AppConstants.xEndpoint;
      case AuthProvider.discord:
        return AppConstants.discordEndpoint;
      case AuthProvider.facebook:
        return AppConstants.facebookEndpoint;
      // case AuthProvider.spotify:
      //   return AppConstants.spotifyEndpoint;
      case AuthProvider.reddit:
        return AppConstants.redditEndpoint;
      default:
        return "";
    }
  }
}
