import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/authorization_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/game_instruction/game_instruction_sheet.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/generated_tweet/generated_tweet_sheet.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/rewards/rewards_sheet.dart';
import 'package:isomorph_iq_nanda/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:isomorph_iq_nanda/ui/views/agents/agents_view.dart';
import 'package:isomorph_iq_nanda/ui/views/ai_persona/ai_persona_view.dart';
import 'package:isomorph_iq_nanda/ui/views/choose_plan/choose_plan_view.dart';
import 'package:isomorph_iq_nanda/ui/views/crypto_news/crypto_news_view.dart';
import 'package:isomorph_iq_nanda/ui/views/home/home_view.dart';
import 'package:isomorph_iq_nanda/ui/views/jackpot/jackpot_view.dart';
import 'package:isomorph_iq_nanda/ui/views/main/main_view.dart';
import 'package:isomorph_iq_nanda/ui/views/onboarding/onboarding_view.dart';
import 'package:isomorph_iq_nanda/ui/views/play/play_view.dart';
import 'package:isomorph_iq_nanda/ui/views/sources/sources_view.dart';
import 'package:isomorph_iq_nanda/ui/views/startup/startup_view.dart';
import 'package:isomorph_iq_nanda/ui/views/tweet_settings/tweet_settings_view.dart';
import 'package:isomorph_iq_nanda/ui/views/twitter_persona/twitter_persona_view.dart';
import 'package:isomorph_iq_nanda/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/connect_app/connect_app_sheet.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/topic_interest/topic_interest_sheet.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/views/tagged_tweet/tagged_tweet_view.dart';
import 'package:isomorph_iq_nanda/ui/views/reply_tweet/reply_tweet_view.dart';
import 'package:isomorph_iq_nanda/ui/views/agent_home/agent_home_view.dart';
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
    CustomRoute(page: MainLayoutView),
    CustomRoute(page: TaggedTweetView),
    CustomRoute(page: ReplyTweetView),
    CustomRoute(page: AgentHomeView),
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
    StackedBottomsheet(classType: ConnectAppSheet),
    StackedBottomsheet(classType: TopicInterestSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
// @stacked-dialog
  ],
)
class App {}
