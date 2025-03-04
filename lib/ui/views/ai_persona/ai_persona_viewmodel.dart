import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AiPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  void navigateBack() {
    _routerService.back();
  }

  // Slider values
  double degenValue = 2;
  double humorValue = 1;
  double storytellingValue = 3;
  double optimismValue = 4;
  double enthusiasmValue = 5;

  TextEditingController accountsController = TextEditingController();

  List<String> selectedTopics = ["Bitcoin", "Decentralisation", "NFT’s"];

  Map<String, double> sliderValues = {
    "Degen": 2,
    "Humor": 1,
    "Storytelling": 3,
    "Optimism": 4,
    "Enthusiasm": 5,
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

  void fetchSliderValues() async {
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getUserPersonality(userId: userId);
      final responseMap = response.data.toJson();
      responseMap.forEach((key, value) {
        String capitalizedKey = key[0].toUpperCase() + key.substring(1);

        if (sliderValues.containsKey(capitalizedKey)) {
          sliderValues[capitalizedKey] = value.toDouble();
        }
      });

      degenValue = sliderValues["Degen"]!;
      humorValue = sliderValues["Humor"]!;
      storytellingValue = sliderValues["Storytelling"]!;
      optimismValue = sliderValues["Optimism"]!;
      enthusiasmValue = sliderValues["Enthusiasm"]!;
      debugPrint("Success");
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching slider values in ai_persona: $e');
    }
  }

  void updateSlider(String title, double value) {
    sliderValues[title] = value;
    notifyListeners();
  }

  void changeTopics() {
    debugPrint("Change Topics Clicked!");
  }

  void confirmChanges() async {
    setBusyForObject('personaUpdating', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      await _apiService.postUserPersonality(
          userId: userId, sliderValues: sliderValues);
      debugPrint("Success");
    } catch (e) {
      debugPrint('Error confirming changes in ai_persona: $e');
    } finally {
      setBusyForObject('personaUpdating', false);
    }
  }
}
