import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/ui/widgets/google_auth_webview.dart';
import 'package:stacked/stacked.dart';

class GoogleAuthViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  // Future<void> initialise() async {
  //   await fetchGoogleAuthLink(userId: 'a3209b97-548b-49ec-8e62-5c26dab3519f');
  // }

  String? _authUrl;
  String? get authUrl => _authUrl;

  SignAuth? _googleSign;
  SignAuth? get googleSign => _googleSign;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGoogleAuthLink({required String userId}) async {
    try {
      setBusy(true);
      final authUrl = await _apiService.getGoogleAuthLink(userId: userId);
      GoogleAuthWebview(
        initialUrl: authUrl.data.link,
        onSuccess: (code) {
          // Handle successful auth code
          // You can exchange code for tokens here
          debugPrint('Authorization code: $code');
        },
        onError: (error) {
          _errorMessage = 'Authorization failed: $error';
          notifyListeners();
        },
      );
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
    setBusy(false);
  }

  // void handleRedirect(String url) {
  //   if (url.startsWith("https://api.isomorphiq.com/google/verify")) {
  //     Uri uri = Uri.parse(url);
  //     String? authCode = uri.queryParameters["code"];

  //     if (authCode != null) {
  //       // Navigate back with the auth code
  //       _routerService.back(result: authCode);
  //     }
  //   }
  // }
}
