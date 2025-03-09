import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/authorization_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/bottom_sheets/game_instruction/game_instruction_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/generated_tweet/generated_tweet_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/play_instructions/play_instructions_sheet.dart';
import 'package:isomorph_iq/ui/bottom_sheets/rewards/rewards_sheet.dart';
import 'package:isomorph_iq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:isomorph_iq/ui/views/agents/agents_view.dart';
import 'package:isomorph_iq/ui/views/ai_persona/ai_persona_view.dart';
import 'package:isomorph_iq/ui/views/choose_plan/choose_plan_view.dart';
import 'package:isomorph_iq/ui/views/crypto_news/crypto_news_view.dart';
import 'package:isomorph_iq/ui/views/home/home_view.dart';
import 'package:isomorph_iq/ui/views/jackpot/jackpot_view.dart';
import 'package:isomorph_iq/ui/views/main/main_view.dart';
import 'package:isomorph_iq/ui/views/onboarding/onboarding_view.dart';
import 'package:isomorph_iq/ui/views/play/play_view.dart';
import 'package:isomorph_iq/ui/views/sources/sources_view.dart';
import 'package:isomorph_iq/ui/views/startup/startup_view.dart';
import 'package:isomorph_iq/ui/views/tweet_settings/tweet_settings_view.dart';
import 'package:isomorph_iq/ui/views/twitter_persona/twitter_persona_view.dart';
import 'package:isomorph_iq/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: MainView),
    CustomRoute(page: OnboardingView),
    CustomRoute(page: SourcesView),
    CustomRoute(page: HomeView),
    CustomRoute(page: JackpotView),
    CustomRoute(page: PlayView),
    CustomRoute(page: AgentsView),
    CustomRoute(page: TwitterPersonaView),
    CustomRoute(page: CryptoNewsAgentView),
    CustomRoute(page: ChoosePlanView),
    CustomRoute(page: AiPersonaView),
    CustomRoute(page: TweetSettingsView),
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
    LazySingleton(classType: AuthorizationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: RewardsSheet),
    StackedBottomsheet(classType: GameInstructionSheet),
    StackedBottomsheet(classType: GeneratedTweetSheet),
    StackedBottomsheet(classType: PlayInstructionsSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
// @stacked-dialog
  ],
)
class App {}
