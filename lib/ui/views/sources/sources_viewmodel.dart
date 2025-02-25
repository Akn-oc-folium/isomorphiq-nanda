import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/connections_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class SourcesViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  Connections? _connections;
  Connections? get connections => _connections;

  Future<void> initialise() async {
    setBusy(true);
    try {
      debugPrint("Fetching connections...");
      final retrievedConnections = await _hiveService
          .retrieveData(kUserBox, kAppsConnectionsKey)
          .timeout(const Duration(seconds: 3), onTimeout: () {
        debugPrint("Timeout occurred while retrieving data.");
        return null;
      });

      if (retrievedConnections == null) {
        debugPrint("No existing connections found, initializing empty object.");
        _connections = Connections(); // Ensure it's never null
      } else {
        _connections = retrievedConnections;
        debugPrint("Connections retrieved: $_connections");
      }
    } catch (e, stackTrace) {
      debugPrint("Error in initialise(): $e\n$stackTrace");
    } finally {
      setBusy(false);
    }
  }

  void _handleMessage(html.Event event) {
    if (event is! html.MessageEvent) return;
    if (event.origin != "https://api.isomorphiq.com") return;

    try {
      final responseJson =
          jsonDecode(event.data as String) as Map<String, dynamic>;
      final statusCode = responseJson['code'] as int;
      final message = responseJson['message'] as String;

      if (statusCode == 200) {
        _isConnected = true;
        // Handle any additional data from the response
        final responseData = responseJson['data'] as Map<String, dynamic>?;
        debugPrint('Authentication successful: $message');
        debugPrint('Additional data: $responseData');
      } else {
        debugPrint('Authentication failed: $message');
        // Show error to user
      }
    } catch (e) {
      debugPrint('Error parsing authentication response: $e');
    } finally {
      rebuildUi();
      html.window.removeEventListener('message', _handleMessage);
    }
  }

  Future<void> connectToGoogle() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    debugPrint("User id is: $userId");
    try {
      debugPrint("User id inside try is: $userId");
      final authUrl = await _apiService.getGoogleAuthLink(userId: userId);
      debugPrint("Auth link is: ${authUrl.data.link}");
      final popup = html.window.open(authUrl.data.link, 'GoogleAuth',
          'width=600,height=800,toolbar=no,location=no,status=no');

      // Listen for messages from the popup
      html.window.addEventListener('message', _handleMessage);

      // Fallback check if popup closed without completing
      Future.delayed(const Duration(minutes: 2), () {
        if (popup.closed ?? false) {
          debugPrint('Authentication timed out');
          rebuildUi();
        }
      });
    } catch (e) {
      debugPrint('Connection error: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> connectToDiscord() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      debugPrint("User id inside try is: $userId");
      final authUrl = await _apiService.getDiscordAuthLink(userId: userId);
      debugPrint("Auth link is: ${authUrl.data.link}");
      final popup = html.window.open(authUrl.data.link, 'DiscordAuth',
          'width=600,height=800,toolbar=no,location=no,status=no');

      // Listen for messages from the popup
      html.window.addEventListener('message', _handleMessage);

      // Fallback check if popup closed without completing
      Future.delayed(const Duration(minutes: 2), () {
        if (popup.closed ?? false) {
          debugPrint('Authentication timed out');
          rebuildUi();
        }
      });
    } catch (e) {
      debugPrint('Connection error: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> connectToX() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      debugPrint("User id inside try is: $userId");
      final authUrl = await _apiService.getTwitterAuthLink(userId: userId);
      debugPrint("Auth link is: ${authUrl.data.link}");
      final popup = html.window.open(authUrl.data.link, 'TwitterAuth',
          'width=600,height=800,toolbar=no,location=no,status=no');

      // Listen for messages from the popup
      html.window.addEventListener('message', _handleMessage);

      // Fallback check if popup closed without completing
      Future.delayed(const Duration(minutes: 2), () {
        if (popup.closed ?? false) {
          debugPrint('Authentication timed out');
          rebuildUi();
        }
      });
    } catch (e) {
      debugPrint('Connection error: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> connectToFacebook() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      debugPrint("User id inside try is: $userId");
      final authUrl = await _apiService.getFacebookAuthLink(userId: userId);
      debugPrint("Auth link is: ${authUrl.data.link}");
      final popup = html.window.open(authUrl.data.link, 'FacebookAuth',
          'width=600,height=800,toolbar=no,location=no,status=no');

      // Listen for messages from the popup
      html.window.addEventListener('message', _handleMessage);

      // Fallback check if popup closed without completing
      Future.delayed(const Duration(minutes: 2), () {
        if (popup.closed ?? false) {
          debugPrint('Authentication timed out');
          rebuildUi();
        }
      });
    } catch (e) {
      debugPrint('Connection error: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> connectToSpotify() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      debugPrint("User id inside try is: $userId");
      final authUrl = await _apiService.getSpotifyAuthLink(userId: userId);
      debugPrint("Auth link is: ${authUrl.data.link}");
      final popup = html.window.open(authUrl.data.link, 'SpotifyAuth',
          'width=600,height=800,toolbar=no,location=no,status=no');

      // Listen for messages from the popup
      html.window.addEventListener('message', _handleMessage);

      // Fallback check if popup closed without completing
      Future.delayed(const Duration(minutes: 2), () {
        if (popup.closed ?? false) {
          debugPrint('Authentication timed out');
          rebuildUi();
        }
      });
    } catch (e) {
      debugPrint('Connection error: $e');
    } finally {
      setBusy(false);
    }
  }
}
