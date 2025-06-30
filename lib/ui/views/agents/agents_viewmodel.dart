import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void onPlanUpgradePressed() {
    _routerService.navigateToChoosePlanView();
  }

  void onTwitterPersonaPressed() {
    _routerService.navigateToTwitterPersonaView();
  }

  void onAIPersonaPressed() {
    _routerService.navigateToAiPersonaView();
  }

  void onCryptoNewsPressed() {
    _routerService.navigateToCryptoNewsAgentView();
  }

  void navigateBack() {
    _routerService.back();
  }
}
