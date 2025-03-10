// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // StackedRouterGenerator
// // **************************************************************************

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:flutter/material.dart' as _i16;
// import 'package:stacked/stacked.dart' as _i15;
// import 'package:stacked_services/stacked_services.dart' as _i14;

// import '../ui/views/agents/agents_view.dart' as _i8;
// import '../ui/views/agents_twitter_persona/agents_twitter_persona_view.dart'
//     as _i9;
// import '../ui/views/ai_persona/ai_persona_view.dart' as _i12;
// import '../ui/views/choose_plan/choose_plan_view.dart' as _i11;
// import '../ui/views/crypto_news_agent/crypto_news_agent_view.dart' as _i10;
// import '../ui/views/earn/earn_view.dart' as _i5;
// import '../ui/views/home/home_view.dart' as _i2;
// import '../ui/views/jackpot/jackpot_view.dart' as _i6;
// import '../ui/views/onboarding/onboarding_view.dart' as _i3;
// import '../ui/views/play/play_view.dart' as _i7;
// import '../ui/views/sources/sources_view.dart' as _i4;
// import '../ui/views/startup/startup_view.dart' as _i1;
// import '../ui/views/unknown/unknown_view.dart' as _i13;

// final stackedRouter =
//     StackedRouterWeb(navigatorKey: _i14.StackedService.navigatorKey);

// class StackedRouterWeb extends _i15.RootStackRouter {
//   StackedRouterWeb({_i16.GlobalKey<_i16.NavigatorState>? navigatorKey})
//       : super(navigatorKey);

//   @override
//   final Map<String, _i15.PageFactory> pagesMap = {
//     StartupViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i1.StartupView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     MainViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i2.MainView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     OnboardingViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i3.OnboardingView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     SourcesViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i4.SourcesView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     HomeViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i5.HomeView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     JackpotViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i6.JackpotView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     PlayViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i7.PlayView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     AgentsViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i8.AgentsView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     AgentsTwitterPersonaViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i9.AgentsTwitterPersonaView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     CryptoNewsAgentViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i10.CryptoNewsAgentView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     ChoosePlanViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i11.ChoosePlanView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     AiPersonaViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i12.AiPersonaView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//     UnknownViewRoute.name: (routeData) {
//       return _i15.CustomPage<dynamic>(
//         routeData: routeData,
//         child: const _i13.UnknownView(),
//         opaque: true,
//         barrierDismissible: false,
//       );
//     },
//   };

//   @override
//   List<_i15.RouteConfig> get routes => [
//         _i15.RouteConfig(
//           StartupViewRoute.name,
//           path: '/',
//         ),
//         _i15.RouteConfig(
//           MainViewRoute.name,
//           path: '/home-view',
//         ),
//         _i15.RouteConfig(
//           OnboardingViewRoute.name,
//           path: '/onboarding-view',
//         ),
//         _i15.RouteConfig(
//           SourcesViewRoute.name,
//           path: '/sources-view',
//         ),
//         _i15.RouteConfig(
//           HomeViewRoute.name,
//           path: '/earn-view',
//         ),
//         _i15.RouteConfig(
//           JackpotViewRoute.name,
//           path: '/jackpot-view',
//         ),
//         _i15.RouteConfig(
//           PlayViewRoute.name,
//           path: '/play-view',
//         ),
//         _i15.RouteConfig(
//           AgentsViewRoute.name,
//           path: '/agents-view',
//         ),
//         _i15.RouteConfig(
//           AgentsTwitterPersonaViewRoute.name,
//           path: '/agents-twitter-persona-view',
//         ),
//         _i15.RouteConfig(
//           CryptoNewsAgentViewRoute.name,
//           path: '/crypto-news-agent-view',
//         ),
//         _i15.RouteConfig(
//           ChoosePlanViewRoute.name,
//           path: '/choose-plan-view',
//         ),
//         _i15.RouteConfig(
//           AiPersonaViewRoute.name,
//           path: '/ai-persona-view',
//         ),
//         _i15.RouteConfig(
//           UnknownViewRoute.name,
//           path: '/404',
//         ),
//         _i15.RouteConfig(
//           '*#redirect',
//           path: '*',
//           redirectTo: '/404',
//           fullMatch: true,
//         ),
//       ];
// }

// /// generated route for
// /// [_i1.StartupView]
// class StartupViewRoute extends _i15.PageRouteInfo<void> {
//   const StartupViewRoute()
//       : super(
//           StartupViewRoute.name,
//           path: '/',
//         );

//   static const String name = 'StartupView';
// }

// /// generated route for
// /// [_i2.MainView]
// class MainViewRoute extends _i15.PageRouteInfo<void> {
//   const MainViewRoute()
//       : super(
//           MainViewRoute.name,
//           path: '/home-view',
//         );

//   static const String name = 'MainView';
// }

// /// generated route for
// /// [_i3.OnboardingView]
// class OnboardingViewRoute extends _i15.PageRouteInfo<void> {
//   const OnboardingViewRoute()
//       : super(
//           OnboardingViewRoute.name,
//           path: '/onboarding-view',
//         );

//   static const String name = 'OnboardingView';
// }

// /// generated route for
// /// [_i4.SourcesView]
// class SourcesViewRoute extends _i15.PageRouteInfo<void> {
//   const SourcesViewRoute()
//       : super(
//           SourcesViewRoute.name,
//           path: '/sources-view',
//         );

//   static const String name = 'SourcesView';
// }

// /// generated route for
// /// [_i5.HomeView]
// class HomeViewRoute extends _i15.PageRouteInfo<void> {
//   const HomeViewRoute()
//       : super(
//           HomeViewRoute.name,
//           path: '/earn-view',
//         );

//   static const String name = 'HomeView';
// }

// /// generated route for
// /// [_i6.JackpotView]
// class JackpotViewRoute extends _i15.PageRouteInfo<void> {
//   const JackpotViewRoute()
//       : super(
//           JackpotViewRoute.name,
//           path: '/jackpot-view',
//         );

//   static const String name = 'JackpotView';
// }

// /// generated route for
// /// [_i7.PlayView]
// class PlayViewRoute extends _i15.PageRouteInfo<void> {
//   const PlayViewRoute()
//       : super(
//           PlayViewRoute.name,
//           path: '/play-view',
//         );

//   static const String name = 'PlayView';
// }

// /// generated route for
// /// [_i8.AgentsView]
// class AgentsViewRoute extends _i15.PageRouteInfo<void> {
//   const AgentsViewRoute()
//       : super(
//           AgentsViewRoute.name,
//           path: '/agents-view',
//         );

//   static const String name = 'AgentsView';
// }

// /// generated route for
// /// [_i9.AgentsTwitterPersonaView]
// class AgentsTwitterPersonaViewRoute extends _i15.PageRouteInfo<void> {
//   const AgentsTwitterPersonaViewRoute()
//       : super(
//           AgentsTwitterPersonaViewRoute.name,
//           path: '/agents-twitter-persona-view',
//         );

//   static const String name = 'AgentsTwitterPersonaView';
// }

// /// generated route for
// /// [_i10.CryptoNewsAgentView]
// class CryptoNewsAgentViewRoute extends _i15.PageRouteInfo<void> {
//   const CryptoNewsAgentViewRoute()
//       : super(
//           CryptoNewsAgentViewRoute.name,
//           path: '/crypto-news-agent-view',
//         );

//   static const String name = 'CryptoNewsAgentView';
// }

// /// generated route for
// /// [_i11.ChoosePlanView]
// class ChoosePlanViewRoute extends _i15.PageRouteInfo<void> {
//   const ChoosePlanViewRoute()
//       : super(
//           ChoosePlanViewRoute.name,
//           path: '/choose-plan-view',
//         );

//   static const String name = 'ChoosePlanView';
// }

// /// generated route for
// /// [_i12.AiPersonaView]
// class AiPersonaViewRoute extends _i15.PageRouteInfo<void> {
//   const AiPersonaViewRoute()
//       : super(
//           AiPersonaViewRoute.name,
//           path: '/ai-persona-view',
//         );

//   static const String name = 'AiPersonaView';
// }

// /// generated route for
// /// [_i13.UnknownView]
// class UnknownViewRoute extends _i15.PageRouteInfo<void> {
//   const UnknownViewRoute()
//       : super(
//           UnknownViewRoute.name,
//           path: '/404',
//         );

//   static const String name = 'UnknownView';
// }

// extension RouterStateExtension on _i14.RouterService {
//   Future<dynamic> navigateToStartupView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const StartupViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToMainView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const MainViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToOnboardingView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const OnboardingViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToSourcesView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const SourcesViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToHomeView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const HomeViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToJackpotView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const JackpotViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToPlayView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const PlayViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToAgentsView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const AgentsViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToAgentsTwitterPersonaView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const AgentsTwitterPersonaViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToCryptoNewsAgentView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const CryptoNewsAgentViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToChoosePlanView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const ChoosePlanViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToAiPersonaView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const AiPersonaViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> navigateToUnknownView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return navigateTo(
//       const UnknownViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithStartupView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const StartupViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithMainView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const MainViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithOnboardingView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const OnboardingViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithSourcesView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const SourcesViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithHomeView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const HomeViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithJackpotView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const JackpotViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithPlayView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const PlayViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithAgentsView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const AgentsViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithAgentsTwitterPersonaView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const AgentsTwitterPersonaViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithCryptoNewsAgentView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const CryptoNewsAgentViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithChoosePlanView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const ChoosePlanViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithAiPersonaView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const AiPersonaViewRoute(),
//       onFailure: onFailure,
//     );
//   }

//   Future<dynamic> replaceWithUnknownView(
//       {void Function(_i15.NavigationFailure)? onFailure}) async {
//     return replaceWith(
//       const UnknownViewRoute(),
//       onFailure: onFailure,
//     );
//   }
// }
