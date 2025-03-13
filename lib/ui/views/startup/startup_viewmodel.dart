import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _hiveService = locator<HiveService>();
  // final _apiService = locator<ApiService>();
  final TelegramWebApp _telegramWebApp = TelegramWebApp.instance;
  final DialogService _dialogService = locator<DialogService>();

  String? _userFirstName;
  String? get userFirstName => _userFirstName;

  String? _username;
  String? get username => _username;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    await _updateUserDetails();

    // try {
    //   final jwtToken = await _hiveService.retrieveData(kUserBox, kJwtTokenKey);
    //   if (jwtToken == null) {
    //     // Call api to get jwt
    //     var hashOutput =
    //         sha256.convert(utf8.encode("$username$userFirstName")).toString();
    //     final jwt =
    //         await _apiService.getJwt(username: username!, hash: hashOutput);
    //     debugPrint("JWT Token: $jwt");
    //     await _hiveService.storeData(kUserBox, kJwtTokenKey, jwt);
    //     await _hiveService.storeData(kUserBox, kHashKey, hashOutput);
    //   } else {
    //     debugPrint("JWT already exists in Hive");
    //   }
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  Future<void> _updateUserDetails() async {
    final telegramUser = _telegramWebApp.initDataUnsafe?.user;

    if (telegramUser?.username == null) {
      var response = await _dialogService.showDialog(
        title: 'Error: Telegram Username Required',
        description:
            "It looks like your Telegram profile doesn't have a username set yet. Please update your Telegram settings by adding a username to your profile, then try again. This is required to access our app.",
        barrierDismissible: false,
      );
      if (response?.confirmed ?? false) {
        _telegramWebApp.close();
      }
    } else {
      final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
      if (userId != null) {
        _routerService.replaceWith(const MainViewRoute());
      } else {
        await _hiveService.storeData(
            kUserBox, kFirstNameKey, telegramUser?.firstName);
        await _hiveService.storeData(
            kUserBox, kUsernameKey, telegramUser?.username);
        _routerService.replaceWith(const OnboardingViewRoute());
      }
    }
  }
}
