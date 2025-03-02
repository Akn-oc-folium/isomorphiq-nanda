import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GeneratedTweetSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();

  final String generatedTweetContent;

  GeneratedTweetSheetModel({required this.generatedTweetContent});

  void saveTweet(String tweetStatus) async {
    try {
      if (generatedTweetContent != '') {
        print('saving, $generatedTweetContent');
        final response = await _apiService.saveGeneratedTweet(
            userId: 'cc23fa3d-beca-49db-8f04-1f0c6a8cbfec',
            content: generatedTweetContent,
            tweetStatus: tweetStatus);
        if (response.code == 200) {
          _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
          rebuildUi();
        }
      }
    } catch (e) {
      print('Error fetching tweets: $e');
    }
  }
}
