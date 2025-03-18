import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AiPersonaViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final ApiService _apiService = locator<ApiService>();
  final HiveService _hiveService = locator<HiveService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final TextEditingController accountsController = TextEditingController();

  List<String> selectedTopics = ["Bitcoin", "Decentralisation", "NFT's"];

  /// Default slider values for each personality aspect.
  final Map<String, double> sliderValues = {
    "Degen": 1,
    "Humor": 1,
    "Storytelling": 1,
    "Optimism": 1,
    "Enthusiasm": 1,
  };

  final List<Map<String, String>> sliderList = [
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

  Map<String, List<String>> currentTopics = {
    "Web3 and Crypto": ["NFTs", "Decentralisation", "Bitcoin"],
    "AI and ML": ["Bitcoin", "Workflow Automation", "Privacy-first AI models"],
    "Crypto X AI": ["Automated DAOs", "Predictive analytics", "On-chain AI"],
  };

  /// Getters for slider values to avoid duplicate state.
  double get degenValue => sliderValues["Degen"] ?? 1;
  double get humorValue => sliderValues["Humor"] ?? 1;
  double get storytellingValue => sliderValues["Storytelling"] ?? 1;
  double get optimismValue => sliderValues["Optimism"] ?? 1;
  double get enthusiasmValue => sliderValues["Enthusiasm"] ?? 1;

  /// Capitalizes the first letter of the given string.
  String capitalize(String text) =>
      text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;

  /// Fetches the slider values from the API and updates the [sliderValues] map.
  Future<void> fetchSliderValues() async {
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getUserPersonality(userId: userId);
      final Map<String, dynamic> responseMap = response.data.toJson();

      responseMap.forEach((key, value) {
        final capitalizedKey = capitalize(key);
        if (sliderValues.containsKey(capitalizedKey)) {
          sliderValues[capitalizedKey] = (value as num).toDouble();
        }
      });

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching slider values in ai_persona: $e');
    }
  }

  /// Updates a specific slider value and notifies listeners.
  void updateSlider(String title, double value) {
    if (sliderValues.containsKey(title)) {
      sliderValues[title] = value;
      notifyListeners();
    }
  }

  /// Placeholder for topic change action.
  void changeTopics() async {
    debugPrint("Change Topics Clicked!");
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.topicInterest,
      barrierDismissible: false,
      title: 'Edit your topics & interests',
      data: currentTopics,
      isScrollControlled: true,
    );
    if (response?.confirmed ?? false) {
      debugPrint("Ready to send chip data to backend");
    }
  }

  /// Confirms changes by posting updated slider values to the API.
  Future<void> confirmChanges() async {
    setBusyForObject('personaUpdating', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    final username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    try {
      await _apiService.postUserPersonality(
        userId: userId,
        username: username,
        sliderValues: sliderValues,
      );
      debugPrint("Successfully updated user personality.");
    } catch (e) {
      debugPrint('Error confirming changes in ai_persona: $e');
    } finally {
      setBusyForObject('personaUpdating', false);
      _routerService.back();
    }
  }

  @override
  void dispose() {
    accountsController.dispose();
    super.dispose();
  }
}
