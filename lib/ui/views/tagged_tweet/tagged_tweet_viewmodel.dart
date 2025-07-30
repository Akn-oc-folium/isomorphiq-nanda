import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.bottomsheets.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/generated_tweet/generated_tweet_sheet_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TaggedTweetViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool showFilterPanel = false;
  bool showDiscussionPanel = false;

  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  String? selectedTweetId;

  List<TaggedTweet> taggedTweets = [
    TaggedTweet(
      id: "tweet1",
      user: "@abdsadc_134",
      content:
          "Pi Network, the closely followed tap-to-earn cryptocurrency network,  launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project. Pi Network, the closely followed tap-to-earn cryptocurrency network,  launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.",
    ),
  ];

  List<String> todayOptions = ["Pi Network launch", "Elon Musk Starship"];
  List<String> previous30DaysOptions = [
    "Pi Network launch",
    "Elon Musk Starship"
  ];

  String currentDiscussionPrompt =
      "GM Ans, what do you want to know about the latest Pi Network mainnet.";

  void loadTaggedTweets() {}

  void toggleFilterPanel() {
    showFilterPanel = !showFilterPanel;
    showDiscussionPanel = false;
    notifyListeners();
  }

  void closePanel() {
    showFilterPanel = false;
    showDiscussionPanel = false;
    selectedTweetId = null;
    notifyListeners();
  }

  void sendDiscussionMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      chatMessages.add(ChatMessage(text: text, isUser: true));
      messageController.clear();

      // TODO: Call your API to get bot response and add it to chatMessages
      notifyListeners();
    }
  }

  void startDiscussion(String tweetId) {
    selectedTweetId = tweetId;
    showDiscussionPanel = true;
    showFilterPanel = false;
    notifyListeners();
  }

  void deleteTweet(String tweetId) {
    taggedTweets.removeWhere((t) => t.id == tweetId);
    if (selectedTweetId == tweetId) selectedTweetId = null;
    notifyListeners();
  }

  void navigateBack() => _routerService.back();

  void openGeneratedTweetModal(TaggedTweet tweet) async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.generatedTweet,
      title: 'Tagged Tweet',
      description: tweet.content,
      data: {
        'type': TweetSheetType.tagged,
        'tweetId': tweet.id,
        'handle': tweet.user,
      },
      isScrollControlled: true,
    );

    if (response?.confirmed == true &&
        response?.data?['startDiscussion'] == true) {
      final tweetId = response!.data!['tweetId'];
      startDiscussion(tweetId);
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class TaggedTweet {
  final String id;
  final String user;
  final String content;

  TaggedTweet({
    required this.id,
    required this.user,
    required this.content,
  });
}
