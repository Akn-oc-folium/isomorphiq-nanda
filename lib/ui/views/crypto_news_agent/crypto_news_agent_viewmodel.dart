import 'package:isomorph_iq/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CryptoNewsAgentViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateBack() {
    _routerService.back();
  }

  void readMore() {}

  void previousNews() {}

  void nextNews() {}

  void fetchNews() {}
}
