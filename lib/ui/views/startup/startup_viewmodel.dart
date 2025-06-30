import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/app/app.router.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class TelegramUser {
  final String username;
  final String firstName;
  final String lastName;

  TelegramUser({
    required this.username,
    required this.firstName,
    required this.lastName,
  });
}

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _hiveService = locator<HiveService>();
  final _apiService = locator<ApiService>();
  final TelegramWebApp _telegramWebApp = TelegramWebApp.instance;
  final DialogService _dialogService = locator<DialogService>();

  String? _userFirstName;
  String? get userFirstName => _userFirstName;

  String? _userLastName;
  String? get userLastName => _userLastName;

  String? _username;
  // String? get username => _username;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    await _updateUserDetails();

    try {
      final jwtToken = await _hiveService.retrieveData(kUserBox, kJwtTokenKey);
      debugPrint("JWT Token outside: $jwtToken");
      if (jwtToken == null) {
        var hashOutput = sha256
            .convert(utf8.encode("$_username$_userFirstName $_userLastName"))
            .toString();
        debugPrint("Hash Output: $hashOutput");
        final jwtResponse =
            await _apiService.getJwt(username: _username!, hash: hashOutput);
        debugPrint("JWT Token: ${jwtResponse.data!.jwt}");
        await _hiveService.storeData(
            kUserBox, kJwtTokenKey, jwtResponse.data!.jwt);
        await _hiveService.storeData(kUserBox, kHashKey, hashOutput);
      } else {
        debugPrint("JWT already exists in Hive");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _updateUserDetails() async {
    //final telegramUser = _telegramWebApp.initDataUnsafe?.user;
    TelegramUser telegramUser =
        TelegramUser(username: 'monky75', firstName: 'Ankit', lastName: 'Nath');
    if (telegramUser?.username == null) {
      var response = await _dialogService.showDialog(
        title: 'Error: Telegram Username Required',
        description:
            "It looks like your Telegram profile doesn't have a username set yet. Please update your Telegram settings by adding a username to your profile, then try again. This is required to access our app.",
        barrierDismissible: false,
      );
      if (response?.confirmed ?? false) {
        _telegramWebApp.close();
      }
    } else {
      final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
      if (userId != null) {
        debugPrint("User id: $userId");
        _routerService.replaceWith(const MainViewRoute());
      } else {
        debugPrint("User id doesn't exist");
        _username = telegramUser?.username;
        _userFirstName = telegramUser?.firstName;
        _userLastName = telegramUser?.lastName;
        await _hiveService.storeData(
            kUserBox, kFirstNameKey, telegramUser?.firstName);
        await _hiveService.storeData(
            kUserBox, kUsernameKey, telegramUser?.username);
        _routerService.replaceWith(const OnboardingViewRoute());
      }
    }
  }
}
