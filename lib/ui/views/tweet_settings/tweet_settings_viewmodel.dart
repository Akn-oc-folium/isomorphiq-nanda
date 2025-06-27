import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TweetSettingsViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  // Slider values
  double tweetFrequency = 0.83;
  double replyFrequency = 0.83;
  bool randomize = true;

  Map<String, double> sliderValues = {
    "tweetFrequency": 0.83,
    "replyFrequency": 0.83,
  };

  final List<Map<String, dynamic>> sliderList = [
    {"title": "Tweet Frequency", "leftLabel": "30mins", "rightLabel": "12hrs"},
    {"title": "Reply Frequency", "leftLabel": "30mins", "rightLabel": "12hrs"}
  ];

  void updateSlider(String title, double value) {
    sliderValues[title] = value;
    notifyListeners();

    debugPrint('$title; $value');
  }

  void toggleRandomize(bool value) {
    randomize = value;
    notifyListeners();
  }

  void confirmChanges() {
    debugPrint("Confirm Changes Clicked!");
  }

  void navigateBack() {
    _routerService.back();
  }
}
