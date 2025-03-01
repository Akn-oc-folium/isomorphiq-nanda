import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AiPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateBack() {
    _routerService.back();
  }

  // Slider values
  double degenValue = 0.2;
  double humorValue = 0.8;
  double storytellingValue = 0.3;
  double optimismValue = 0.2;
  double enthusiasmValue = 0.9;

  TextEditingController accountsController = TextEditingController();

  List<String> selectedTopics = ["Bitcoin", "Decentralisation", "NFT’s"];

  Map<String, double> sliderValues = {
    "Degen": 0.2,
    "Humor": 0.8,
    "Storytelling": 0.4,
    "Optimism": 0.2,
    "Enthusiasm": 1.0,
  };

  final List<Map<String, dynamic>> sliderList = [
    {"title": "Degen", "leftLabel": "Polite", "rightLabel": "Brainrot"},
    {"title": "Humor", "leftLabel": "Serious", "rightLabel": "Highly Comedic"},
    {
      "title": "Storytelling",
      "leftLabel": "Factual",
      "rightLabel": "Analogies"
    },
    {"title": "Optimism", "leftLabel": "Realistic", "rightLabel": "Positive"},
    {"title": "Enthusiasm", "leftLabel": "Monotone", "rightLabel": "Exuberant"},
  ];

  void updateSlider(String title, double value) {
    sliderValues[title] = value;
    notifyListeners();

    // _debounceTimer?.cancel();

    // _debounceTimer = Timer(Duration(milliseconds: 500), () {
    //   sendSliderDataToAPI(title, value);
    // });
  }

  // @override
  // void dispose() {
  //   _debounceTimer?.cancel();
  //   super.dispose();
  // }

  void changeTopics() {
    print("Change Topics Clicked!");
  }

  void confirmChanges() {
    print("Confirm Changes Clicked!");
  }
}
