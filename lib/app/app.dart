import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/bottom_sheets/game_instruction/game_instruction_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/rewards/rewards_sheet.dart';
import 'package:isomorph_iq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:isomorph_iq/ui/views/earn/earn_view.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_view.dart';
import 'package:isomorph_iq/ui/views/home/home_view.dart';
import 'package:isomorph_iq/ui/views/jackpot/jackpot_view.dart';
import 'package:isomorph_iq/ui/views/onboarding/onboarding_view.dart';
import 'package:isomorph_iq/ui/views/play/play_view.dart';
import 'package:isomorph_iq/ui/views/sources/sources_view.dart';
import 'package:isomorph_iq/ui/views/startup/startup_view.dart';
import 'package:isomorph_iq/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    CustomRoute(page: OnboardingView),
    CustomRoute(page: SourcesView),
    CustomRoute(page: EarnView),
    CustomRoute(page: JackpotView),
    CustomRoute(page: PlayView),
    CustomRoute(page: GoogleAuthView),
// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: HiveService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: RewardsSheet),
    StackedBottomsheet(classType: GameInstructionSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
// @stacked-dialog
  ],
)
class App {}