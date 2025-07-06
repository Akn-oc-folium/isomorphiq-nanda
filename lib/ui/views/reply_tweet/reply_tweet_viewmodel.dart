import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/ui/views/tagged_tweet/tagged_tweet_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReplyTweetViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  // UI State
  String? selectedTweetId;
  bool isModifyAccountsPanelVisible = false;

  // Text editing controllers
  TextEditingController replyController = TextEditingController();
  TextEditingController handleInputController = TextEditingController();

  // Tagged tweets dummy data
  List<TaggedTweet> taggedTweets = [
    TaggedTweet(
      id: "tweet1",
      user: "@abdsadc_134",
      content:
          "Pi Network launched its mainnet today at 8 am UTC. A milestone for the project.",
    ),
    TaggedTweet(
      id: "tweet2",
      user: "@elonmusk",
      content:
          "Starship test launch successful. Big day for space exploration!",
    ),
  ];

  // Account modification state
  List<String> selectedAccounts = ["NFTs", "Decentralisation", "Bitcoin"];
  List<String> web3Crypto = ["Ethereum", "BRC-20", "NFT-Fi", "Mixers"];
  List<String> aiAndML = [
    "Bitcoin",
    "Workflow Automation",
    "Quantum Computing",
    "Privacy-first AI models",
    "NVIDIA",
    "Sustainable Energy Solutions"
  ];
  List<String> cryptoXAI = [
    "Automated DAOs",
    "Predictive analytics",
    "Bitcoin",
    "On-chain AI"
  ];

  /// Navigation back
  void navigateBack() => _routerService.back();

  /// Select a tweet to reply
  void startReply(String tweetId) {
    selectedTweetId = tweetId;
    isModifyAccountsPanelVisible = false;
    notifyListeners();
  }

  /// Delete a tweet
  void deleteTweet(String tweetId) {
    taggedTweets.removeWhere((t) => t.id == tweetId);
    if (selectedTweetId == tweetId) {
      selectedTweetId = null;
    }
    notifyListeners();
  }

  /// Generate reply
  void generateReply() {
    // TODO: API call to generate reply based on replyController.text
    print(
        "Generating reply for tweet $selectedTweetId: ${replyController.text}");
  }

  /// Toggle modify accounts panel
  void toggleModifyAccountsPanel() {
    isModifyAccountsPanelVisible = !isModifyAccountsPanelVisible;
    notifyListeners();
  }

  /// Add new handle to selected accounts
  void addHandle() {
    final handle = handleInputController.text.trim();
    if (handle.isNotEmpty && !selectedAccounts.contains(handle)) {
      selectedAccounts.add(handle);
      handleInputController.clear();
      notifyListeners();
    }
  }

  /// Remove account from selected
  void removeAccount(String account) {
    selectedAccounts.remove(account);
    notifyListeners();
  }

  /// Save changes in modify accounts
  void saveChanges() {
    isModifyAccountsPanelVisible = false;
    notifyListeners();
  }
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
