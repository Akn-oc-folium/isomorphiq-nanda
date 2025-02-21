import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SourcesViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateToGoogleAuth() {
    _routerService.navigateToGoogleAuthView();
  }
}
