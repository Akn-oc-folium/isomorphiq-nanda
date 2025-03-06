import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/app_connections_model.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/authorization_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

enum AuthProvider { google, telegram, x, discord, facebook, spotify, reddit }

class SourcesViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final AuthorizationService _authService = locator<AuthorizationService>();

  // Track connection status
  Map<AuthProvider, bool> connectedApps = {
    AuthProvider.google: false,
    AuthProvider.telegram: true,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    AuthProvider.spotify: false,
    AuthProvider.reddit: false,
  };

  /// Tracks loading state per app
  Map<AuthProvider, bool> loadingState = {
    AuthProvider.google: false,
    AuthProvider.telegram: false,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    AuthProvider.spotify: false,
    AuthProvider.reddit: false,
  };

  String? _userId; // = "93855c25-2eb4-49db-98fb-250810934b13";
  String? get userId => _userId;

  AppConnections? _appConnections;
  AppConnections? get appConnections => _appConnections;

  Future<void> initialise() async {
    final savedState = await _hiveService.retrieveData(
        AppConstants.authBox, AppConstants.authKey);
    if (savedState != null) {
      connectedApps = Map<String, dynamic>.from(savedState).map(
        (key, value) => MapEntry(
            AuthProvider.values.firstWhere((e) => e.toString() == key), value),
      );
      notifyListeners();
    }

    _userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    await _fetchConnections();
  }

  Future<void> _saveAuthState() async {
    await _hiveService.storeData(
      AppConstants.authBox,
      AppConstants.authKey,
      connectedApps.map((key, value) => MapEntry(key.toString(), value)),
    );
  }

  Future<void> connectApp(AuthProvider provider) async {
    String appId = provider.name;
    String urlEndPoint = _getAuthUrlEndpoint(provider);

    try {
      loadingState[provider] = true;
      notifyListeners();

      SignAuth signAuth = await _apiService.getAppAuthUrl(
        appId: appId,
        userId: userId!,
        urlEndPoint: urlEndPoint,
      );

      Map<String, dynamic> authResult =
          await _authService.authenticate(signAuth.data.link);

      String message = authResult["message"] as String;
      int statusCode = authResult["statusCode"] as int;

      if (statusCode == 200) {
        connectedApps[provider] = true;
        await _saveAuthState();
        rebuildUi();
      } else {
        // Optionally log or display the error message.
        connectedApps[provider] = false;
        debugPrint("Authentication failed: $message (code: $statusCode)");
      }
    } catch (e) {
      debugPrint(
          "Error during authentication: $e"); // Replace with error UI handling
    } finally {
      loadingState[provider] = false; // Stop loading
      notifyListeners();
    }
  }

  /// Replace with actual API endpoints
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
      case AuthProvider.spotify:
        return AppConstants.spotifyEndpoint;
      case AuthProvider.reddit:
        return AppConstants.redditEndpoint;
      default:
        return "";
    }
  }

  Future<void> _fetchConnections() async {
    setBusy(true);
    try {
      _appConnections = await _apiService.getAppConnections(userId: userId!);
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    } finally {
      setBusy(false);
    }
  }

  // void _listenToPostMessage() {
  //   web.window.addEventListener("message", (event) {
  //     final e = event as web.MessageEvent;
  //     if (e.origin == "https://isomorph-iq.web.app") {
  //       setState(() {
  //         _message = (e.data as JSObject)["message"] as String?;
  //         _statusCode = (e.data as JSObject)["statusCode"] as int?;
  //       });
  //       _handleVerificationSuccess();
  //     } else {
  //       print("Received message from unauthorized origin: ${e.origin}");
  //     }
  //   });
  // }

  // void _handleVerificationSuccess() {
  //   if (_statusCode == 200) {
  //     // Perform actions upon successful verification
  //     print("Twitter Verification Successful: $_message");
  //   }
  // }
}
