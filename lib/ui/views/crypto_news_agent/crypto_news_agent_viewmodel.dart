import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/news_article_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CryptoNewsAgentViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  int _currentIndex = 0;

  NewsArticle? _newsArticles;
  NewsArticle? get currentNews => _newsArticles;

  Future<void> fetchNews() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getCryptoNews(userId: userId);
      _newsArticles = response;
      _currentIndex = 0;
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
    setBusy(false);
    notifyListeners();
  }

  // void readMore() {
  //   if (currentNews?.url != null) {
  //     //_routerService.navigateToExternalWebPage(currentNews!.url);
  //   }
  // }

  // void previousNews() {
  //   if (_currentIndex > 0) {
  //     _currentIndex--;
  //     notifyListeners();
  //   }
  // }

  // void nextNews() {
  //   if (_currentIndex < _newsArticles.length - 1) {
  //     _currentIndex++;
  //     notifyListeners();
  //   }
  // }

  void navigateBack() {
    _routerService.back();
  }
}
