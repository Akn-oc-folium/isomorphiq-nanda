import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/crypto_news_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

class CryptoNewsAgentViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  int _currentIndex = 0;

  List<News> _newsList = [];
  News? get currentNews =>
      _newsList.isNotEmpty ? _newsList[_currentIndex] : null;

  Future<void> fetchNews() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getCryptoNews(
          userId: userId // "ff8bbd4e-6221-48a4-910f-b88c4978c5d5"
          );
      _newsList = response.data!.toList();
      _currentIndex = 0;
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
    setBusy(false);
  }

  void readMore() async {
    if (currentNews?.source != null) {
      UrlLauncherPlugin().launch(currentNews!.source!.url!, useWebView: true);
    }
  }

  void previousNews() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void nextNews() {
    if (_currentIndex < _newsList.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void navigateBack() {
    _routerService.back();
  }
}
