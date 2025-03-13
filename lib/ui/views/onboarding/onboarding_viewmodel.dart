import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  final RouterService _routerService = locator<RouterService>();
  final HiveService _hiveService = locator<HiveService>();

  int _currentPage = 0;
  int get currentPage => _currentPage;

  String? _userFirstName;
  String? get userFirstName => _userFirstName;

  String? _username;
  String? get username => _username;

  Future<void> initialise() async {
    await _retrieveUserDetails();
  }

  Future<void> _retrieveUserDetails() async {
    _userFirstName = await _hiveService.retrieveData(kUserBox, kFirstNameKey);
    _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    notifyListeners();
  }

  // Called whenever the page changes (via swipe or programmatically)
  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void onContinuePressed() {
    if (_currentPage < 2) {
      // Go to the next page
      pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _routerService.replaceWith(const MainViewRoute());
      debugPrint('Onboarding finished!');
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
