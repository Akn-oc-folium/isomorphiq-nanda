import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RewardsSheetModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  // void navigateToJackpot() {
  //   _MainViewModel.navigateToJackpot();
  // }

  Future<void> navigateToJackpot() async {
    _routerService.pop();
  }
}
