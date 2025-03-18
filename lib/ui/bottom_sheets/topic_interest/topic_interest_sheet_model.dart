import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class TopicInterestSheetModel extends BaseViewModel {
  Map<String, List<String>> topics;
  late String selectedCategory;
  TextEditingController topicController = TextEditingController();

  TopicInterestSheetModel({required Map<String, List<String>> initialTopics})
      : topics = Map.from(initialTopics) {
    selectedCategory = topics.keys.isNotEmpty ? topics.keys.first : "";
  }

  void removeTopic(String category, String topic) {
    topics[category]?.remove(topic);
    if (topics[category]?.isEmpty == true) {
      topics.remove(category);
    }
    notifyListeners();
  }

  void addTopic(String category, String topic) {
    if (!topics.containsKey(category)) {
      topics[category] = [];
    }
    if (!topics[category]!.contains(topic)) {
      topics[category]?.add(topic);
    }
    notifyListeners();
  }

  void clearTopicInput() {
    topicController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    topicController.dispose();
    super.dispose();
  }
}
