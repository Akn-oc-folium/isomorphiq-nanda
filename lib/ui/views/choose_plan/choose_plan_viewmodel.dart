import 'package:isomorph_iq/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChoosePlanViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateBack() {
    _routerService.back();
  }

  void upgradePlan(String planName) {}
}
