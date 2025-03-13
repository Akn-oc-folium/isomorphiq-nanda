import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PlayViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  int level = 1;
  int round = 1;
  List<String> chestPool = []; // Cards per round
  List<bool> revealedCards = [false, false, false, false, false];
  List<String> selectedChests = []; // Stores revealed chests per round
  int totalPoints = 0;
  bool cardRevealed = false;

  // Chest probabilities
  static const String kCOMMON = "Common";
  static const String kRARE = "Rare";
  static const String kLEGENDARY = "Legendary";

  final Map<String, int> chestPoints = {
    kCOMMON: 10,
    kRARE: 20,
    kLEGENDARY: 50,
  };

  void playInstructions() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.gameInstruction,
      barrierDismissible: false,
      title: 'Ready to Play?',
      mainButtonTitle: 'Find New Tasks',
      isScrollControlled: true,
      data: [
        {
          "icon": Assets.icons.dollarCoin.path,
          "content":
              "You'll play 5 rounds per game - each round, pick 1 of 5 cards to find chests."
        },
        {
          "icon": Assets.icons.trophy.path,
          "content":
              "Common, Rare, and Legendary chests hold different rewards!"
        },
        {
          "icon": Assets.icons.dollarCoin.path,
          "content":
              "After 5 rounds, the total points from all chests will be added to your balance."
        },
      ],
    );
  }

  // Generate chests based on level
  void generateChests() {
    chestPool.clear();

    if (level == 1) {
      chestPool.addAll([kCOMMON, kCOMMON, kCOMMON, kRARE, kRARE]);
    } else if (level == 2) {
      chestPool.addAll([kCOMMON, kCOMMON, kRARE, kRARE, kLEGENDARY]);
    }

    shuffleChests();
    notifyListeners();
  }

  // Shuffle chests
  void shuffleChests() {
    chestPool.shuffle(Random());
  }

  // User picks a card
  void revealCard(int index) {
    if (!cardRevealed) {
      selectedChests.add(chestPool[index]);
      totalPoints += chestPoints[chestPool[index]]!;
      revealedCards[index] = true;
      cardRevealed = true;
      notifyListeners();
    }
  }

  // Move to next round
  Future<void> nextRound() async {
    if (cardRevealed) {
      if (round < 5) {
        round++;
        revealedCards = [false, false, false, false, false];
        cardRevealed = false;
        generateChests();
        notifyListeners();
      } else {
        debugPrint("Game Over! Total Points: $totalPoints");
        var userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
        await _apiService.postUserPoints(userId: userId, points: totalPoints);
        await _hiveService.storeData(kUserBox, kPlayActiveKey, false);
        openRewardsSheet();
      }
    }
  }

  void openRewardsSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.rewards,
      barrierDismissible: false,
      title: 'You earned\n$totalPoints points!',
      description: 'Keep playing, climb the\nleaderboard, and win big!',
      imageUrl: Assets.images.earnedPoints.path,
      mainButtonTitle: 'Check Leaderboard',
      data: {
        'points': totalPoints,
      },
      isScrollControlled: true,
    );
  }

  // Check if a card is revealed to enable Next Round button
  bool hasRevealedCard() {
    return cardRevealed;
  }

  String getImagePath(String rewardType) {
    if (rewardType == "Rare") return Assets.images.chestLevel2Closed.path;
    if (rewardType == "Legendary") return Assets.images.chestLevel3Closed.path;
    return Assets.images.chestLevel1Closed.path;
  }
}
