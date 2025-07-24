// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i21;
import 'package:stacked/stacked.dart' as _i20;
import 'package:stacked_services/stacked_services.dart' as _i19;

import '../ui/views/agent_home/agent_home_view.dart' as _i17;
import '../ui/views/agents/agents_view.dart' as _i8;
import '../ui/views/ai_persona/ai_persona_view.dart' as _i12;
import '../ui/views/choose_plan/choose_plan_view.dart' as _i11;
import '../ui/views/crypto_news/crypto_news_view.dart' as _i10;
import '../ui/views/home/home_view.dart' as _i5;
import '../ui/views/jackpot/jackpot_view.dart' as _i6;
import '../ui/views/main/main_view.dart' as _i2;
import '../ui/views/main_layout/main_layout_view.dart' as _i14;
import '../ui/views/onboarding/onboarding_view.dart' as _i3;
import '../ui/views/play/play_view.dart' as _i7;
import '../ui/views/reply_tweet/reply_tweet_view.dart' as _i16;
import '../ui/views/sources/sources_view.dart' as _i4;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/tagged_tweet/tagged_tweet_view.dart' as _i15;
import '../ui/views/tweet_settings/tweet_settings_view.dart' as _i13;
import '../ui/views/twitter_persona/twitter_persona_view.dart' as _i9;
import '../ui/views/unknown/unknown_view.dart' as _i18;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i19.StackedService.navigatorKey);

class StackedRouterWeb extends _i20.RootStackRouter {
  StackedRouterWeb({_i21.GlobalKey<_i21.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SourcesViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.SourcesView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    JackpotViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.JackpotView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PlayViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.PlayView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AgentsViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.AgentsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TwitterPersonaViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.TwitterPersonaView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CryptoNewsAgentViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.CryptoNewsAgentView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChoosePlanViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.ChoosePlanView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AiPersonaViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.AiPersonaView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TweetSettingsViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.TweetSettingsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainLayoutViewRoute.name: (routeData) {
      final args = routeData.argsAs<MainLayoutViewArgs>();
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: _i14.MainLayoutView(
          key: args.key,
          body: args.body,
          showRightPanel: args.showRightPanel,
          rightPanel: args.rightPanel,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TaggedTweetViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.TaggedTweetView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReplyTweetViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.ReplyTweetView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AgentHomeViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.AgentHomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i20.RouteConfig(
          MainViewRoute.name,
          path: '/main-view',
        ),
        _i20.RouteConfig(
          OnboardingViewRoute.name,
          path: '/onboarding-view',
        ),
        _i20.RouteConfig(
          SourcesViewRoute.name,
          path: '/sources-view',
        ),
        _i20.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i20.RouteConfig(
          JackpotViewRoute.name,
          path: '/jackpot-view',
        ),
        _i20.RouteConfig(
          PlayViewRoute.name,
          path: '/play-view',
        ),
        _i20.RouteConfig(
          AgentsViewRoute.name,
          path: '/agents-view',
        ),
        _i20.RouteConfig(
          TwitterPersonaViewRoute.name,
          path: '/twitter-persona-view',
        ),
        _i20.RouteConfig(
          CryptoNewsAgentViewRoute.name,
          path: '/crypto-news-agent-view',
        ),
        _i20.RouteConfig(
          ChoosePlanViewRoute.name,
          path: '/choose-plan-view',
        ),
        _i20.RouteConfig(
          AiPersonaViewRoute.name,
          path: '/ai-persona-view',
        ),
        _i20.RouteConfig(
          TweetSettingsViewRoute.name,
          path: '/tweet-settings-view',
        ),
        _i20.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/main-layout-view',
        ),
        _i20.RouteConfig(
          TaggedTweetViewRoute.name,
          path: '/tagged-tweet-view',
        ),
        _i20.RouteConfig(
          ReplyTweetViewRoute.name,
          path: '/reply-tweet-view',
        ),
        _i20.RouteConfig(
          AgentHomeViewRoute.name,
          path: '/agent-home-view',
        ),
        _i20.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i20.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i20.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.MainView]
class MainViewRoute extends _i20.PageRouteInfo<void> {
  const MainViewRoute()
      : super(
          MainViewRoute.name,
          path: '/main-view',
        );

  static const String name = 'MainView';
}

/// generated route for
/// [_i3.OnboardingView]
class OnboardingViewRoute extends _i20.PageRouteInfo<void> {
  const OnboardingViewRoute()
      : super(
          OnboardingViewRoute.name,
          path: '/onboarding-view',
        );

  static const String name = 'OnboardingView';
}

/// generated route for
/// [_i4.SourcesView]
class SourcesViewRoute extends _i20.PageRouteInfo<void> {
  const SourcesViewRoute()
      : super(
          SourcesViewRoute.name,
          path: '/sources-view',
        );

  static const String name = 'SourcesView';
}

/// generated route for
/// [_i5.HomeView]
class HomeViewRoute extends _i20.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i6.JackpotView]
class JackpotViewRoute extends _i20.PageRouteInfo<void> {
  const JackpotViewRoute()
      : super(
          JackpotViewRoute.name,
          path: '/jackpot-view',
        );

  static const String name = 'JackpotView';
}

/// generated route for
/// [_i7.PlayView]
class PlayViewRoute extends _i20.PageRouteInfo<void> {
  const PlayViewRoute()
      : super(
          PlayViewRoute.name,
          path: '/play-view',
        );

  static const String name = 'PlayView';
}

/// generated route for
/// [_i8.AgentsView]
class AgentsViewRoute extends _i20.PageRouteInfo<void> {
  const AgentsViewRoute()
      : super(
          AgentsViewRoute.name,
          path: '/agents-view',
        );

  static const String name = 'AgentsView';
}

/// generated route for
/// [_i9.TwitterPersonaView]
class TwitterPersonaViewRoute extends _i20.PageRouteInfo<void> {
  const TwitterPersonaViewRoute()
      : super(
          TwitterPersonaViewRoute.name,
          path: '/twitter-persona-view',
        );

  static const String name = 'TwitterPersonaView';
}

/// generated route for
/// [_i10.CryptoNewsAgentView]
class CryptoNewsAgentViewRoute extends _i20.PageRouteInfo<void> {
  const CryptoNewsAgentViewRoute()
      : super(
          CryptoNewsAgentViewRoute.name,
          path: '/crypto-news-agent-view',
        );

  static const String name = 'CryptoNewsAgentView';
}

/// generated route for
/// [_i11.ChoosePlanView]
class ChoosePlanViewRoute extends _i20.PageRouteInfo<void> {
  const ChoosePlanViewRoute()
      : super(
          ChoosePlanViewRoute.name,
          path: '/choose-plan-view',
        );

  static const String name = 'ChoosePlanView';
}

/// generated route for
/// [_i12.AiPersonaView]
class AiPersonaViewRoute extends _i20.PageRouteInfo<void> {
  const AiPersonaViewRoute()
      : super(
          AiPersonaViewRoute.name,
          path: '/ai-persona-view',
        );

  static const String name = 'AiPersonaView';
}

/// generated route for
/// [_i13.TweetSettingsView]
class TweetSettingsViewRoute extends _i20.PageRouteInfo<void> {
  const TweetSettingsViewRoute()
      : super(
          TweetSettingsViewRoute.name,
          path: '/tweet-settings-view',
        );

  static const String name = 'TweetSettingsView';
}

/// generated route for
/// [_i14.MainLayoutView]
class MainLayoutViewRoute extends _i20.PageRouteInfo<MainLayoutViewArgs> {
  MainLayoutViewRoute({
    _i21.Key? key,
    required _i21.Widget body,
    bool showRightPanel = false,
    _i21.Widget? rightPanel,
  }) : super(
          MainLayoutViewRoute.name,
          path: '/main-layout-view',
          args: MainLayoutViewArgs(
            key: key,
            body: body,
            showRightPanel: showRightPanel,
            rightPanel: rightPanel,
          ),
        );

  static const String name = 'MainLayoutView';
}

class MainLayoutViewArgs {
  const MainLayoutViewArgs({
    this.key,
    required this.body,
    this.showRightPanel = false,
    this.rightPanel,
  });

  final _i21.Key? key;

  final _i21.Widget body;

  final bool showRightPanel;

  final _i21.Widget? rightPanel;

  @override
  String toString() {
    return 'MainLayoutViewArgs{key: $key, body: $body, showRightPanel: $showRightPanel, rightPanel: $rightPanel}';
  }
}

/// generated route for
/// [_i15.TaggedTweetView]
class TaggedTweetViewRoute extends _i20.PageRouteInfo<void> {
  const TaggedTweetViewRoute()
      : super(
          TaggedTweetViewRoute.name,
          path: '/tagged-tweet-view',
        );

  static const String name = 'TaggedTweetView';
}

/// generated route for
/// [_i16.ReplyTweetView]
class ReplyTweetViewRoute extends _i20.PageRouteInfo<void> {
  const ReplyTweetViewRoute()
      : super(
          ReplyTweetViewRoute.name,
          path: '/reply-tweet-view',
        );

  static const String name = 'ReplyTweetView';
}

/// generated route for
/// [_i17.AgentHomeView]
class AgentHomeViewRoute extends _i20.PageRouteInfo<void> {
  const AgentHomeViewRoute()
      : super(
          AgentHomeViewRoute.name,
          path: '/agent-home-view',
        );

  static const String name = 'AgentHomeView';
}

/// generated route for
/// [_i18.UnknownView]
class UnknownViewRoute extends _i20.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i19.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOnboardingView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OnboardingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSourcesView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SourcesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToJackpotView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const JackpotViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPlayView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PlayViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAgentsView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AgentsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTwitterPersonaView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TwitterPersonaViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCryptoNewsAgentView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CryptoNewsAgentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToChoosePlanView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ChoosePlanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAiPersonaView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AiPersonaViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTweetSettingsView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TweetSettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMainLayoutView({
    _i21.Key? key,
    required _i21.Widget body,
    bool showRightPanel = false,
    _i21.Widget? rightPanel,
    void Function(_i20.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      MainLayoutViewRoute(
        key: key,
        body: body,
        showRightPanel: showRightPanel,
        rightPanel: rightPanel,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTaggedTweetView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TaggedTweetViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToReplyTweetView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ReplyTweetViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAgentHomeView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AgentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOnboardingView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OnboardingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSourcesView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SourcesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithJackpotView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const JackpotViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPlayView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PlayViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAgentsView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AgentsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTwitterPersonaView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TwitterPersonaViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCryptoNewsAgentView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CryptoNewsAgentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithChoosePlanView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ChoosePlanViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAiPersonaView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AiPersonaViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTweetSettingsView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TweetSettingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView({
    _i21.Key? key,
    required _i21.Widget body,
    bool showRightPanel = false,
    _i21.Widget? rightPanel,
    void Function(_i20.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      MainLayoutViewRoute(
        key: key,
        body: body,
        showRightPanel: showRightPanel,
        rightPanel: rightPanel,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTaggedTweetView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TaggedTweetViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithReplyTweetView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ReplyTweetViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAgentHomeView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AgentHomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i20.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
