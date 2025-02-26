import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void onPlanUpgradePressed() {
    _routerService.navigateToChoosePlanView();
  }

  void onTwitterPersonaPressed() {
    _routerService.navigateToAgentsTwitterPersonaView();
  }

  void onAIPersonaPressed() {
    _routerService.navigateToAiPersonaView();
  }

  void onCryptoNewsPressed() {
    _routerService.navigateToCryptoNewsAgentView();
  }
}
