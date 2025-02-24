import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/tweet_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsTwitterPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  List<Tweet> tweets = [];
  bool isLoading = false;

  Future<void> fetchTweets() async {
    isLoading = true;
    notifyListeners();

    try {
      //final response = await _dio.get('');
      //tweets = Tweet.fromJsonList(response.data);
      tweets = [
        Tweet(
            id: 26,
            type: "Tweet",
            content: "Pi Network has launched its mainnet today!",
            creditCost: 5),
        Tweet(
            id: 13,
            type: "Reply",
            content: "This is a great milestone for Pi Network!",
            creditCost: 3),
        Tweet(
            id: 12,
            type: "Reply",
            content: "Excited to see what comes next!",
            creditCost: 2),
        Tweet(
            id: 11,
            type: "Tweet",
            content: "Big news! Bitcoin just hit \$60,000 again!",
            creditCost: 4),
        Tweet(
            id: 10,
            type: "Reply",
            content: "This market is insane! 🚀",
            creditCost: 2),
      ];
    } catch (e) {
      print('Error fetching tweets: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void navigateBack() {
    _routerService.back();
  }
}
