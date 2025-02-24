import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void onTwitterPersonaPressed() {
    _routerService.navigateToAgentsTwitterPersonaView();
  }
}
