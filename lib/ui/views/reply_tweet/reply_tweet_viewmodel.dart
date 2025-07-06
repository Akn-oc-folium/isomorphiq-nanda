import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReplyTweetViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  String? selectedTweetId;
  bool isModifyAccountsPanelVisible = false;

  TextEditingController replyController = TextEditingController();
  TextEditingController handleInputController = TextEditingController();

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

  void navigateBack() => _routerService.back();

  void startReply(String tweetId) {
    selectedTweetId = tweetId;
    isModifyAccountsPanelVisible = false;
    notifyListeners();
  }

  void deleteTweet(String tweetId) {
    taggedTweets.removeWhere((t) => t.id == tweetId);
    if (selectedTweetId == tweetId) {
      selectedTweetId = null;
    }
    notifyListeners();
  }

  void generateReply() {
    print(
        "Generating reply for tweet $selectedTweetId: ${replyController.text}");
  }

  void toggleModifyAccountsPanel() {
    isModifyAccountsPanelVisible = !isModifyAccountsPanelVisible;
    notifyListeners();
  }

  void addHandle() {
    final handle = handleInputController.text.trim();
    if (handle.isNotEmpty && !selectedAccounts.contains(handle)) {
      selectedAccounts.add(handle);
      handleInputController.clear();
      notifyListeners();
    }
  }

  void removeAccount(String account) {
    selectedAccounts.remove(account);
    notifyListeners();
  }

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
