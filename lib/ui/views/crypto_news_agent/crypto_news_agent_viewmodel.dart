import 'package:dio/dio.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/news_article_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CryptoNewsAgentViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final Dio _dio = Dio();

  Map<String, dynamic> sample_data = {
    "articles": [
      {
        "title": "Pi Network mainnet launch sees Pi coin rally over 35%",
        "source": "CBS News",
        "content":
            "Pi coin surged over 35% less than an hour after its highly anticipated mainnet went live. \n\n Pi Network, the closely followed tap-to-earn cryptocurrency network,  launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project, which has been in development for over six years and has operated in an enclosed mainnet since 2021.",
        "imageUrl": "https://example.com/news1.jpg",
        "url": "https://news.bbc.com/market-crash"
      },
      {
        "title": "AI Revolution",
        "source": "TechCrunch",
        "content":
            "Artificial Intelligence is shaping the future of technology.",
        "imageUrl": "https://example.com/news2.jpg",
        "url": "https://techcrunch.com/ai-revolution"
      },
      {
        "title": "Sports: Champions League Final",
        "source": "ESPN",
        "content": "Exciting final between two top teams.",
        "imageUrl": "https://example.com/news3.jpg",
        "url": "https://espn.com/champions-league"
      }
    ]
  };

  List<NewsArticle> _newsArticles = [];
  int _currentIndex = 0;

  NewsArticle? get currentNews =>
      _newsArticles.isNotEmpty ? _newsArticles[_currentIndex] : null;

  Future<void> fetchNews() async {
    setBusy(true);
    try {
      //final response = await _dio.get('');

      if (true) {
        List<dynamic> data = sample_data['articles'];
        _newsArticles = data.map((json) => NewsArticle.fromJson(json)).toList();
        _currentIndex = 0;
      } else {
        print("Failed to fetch news");
      }
    } catch (e) {
      print("Error fetching news: $e");
    }
    setBusy(false);
    notifyListeners();
  }

  void readMore() {
    if (currentNews?.url != null) {
      //_routerService.navigateToExternalWebPage(currentNews!.url);
    }
  }

  void previousNews() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void nextNews() {
    if (_currentIndex < _newsArticles.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void navigateBack() {
    _routerService.back();
  }
}
