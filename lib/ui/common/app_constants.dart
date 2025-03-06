/// The max width the content can ever take up on the screen
const double kdDesktopMaxContentWidth = 1150;

// The max height the homeview will take up
const double kdDesktopMaxContentHeight = 750;

enum TweetStatus { pending, approved, rejected }

class AppConstants {
  AppConstants._();

  // App Configs
  static const String appVersion = '0.0.1';

  // API Constants
  static const int receiveTimeout = 10000;
  static const int connectionTimeout = 30000;
  static const String baseUrl = 'https://api.isomorphiq.com';
  static const String dashboardEndpoint = '/user';
  static const String userPointsEndpoint = '/points';
  static const String leaderboardEndpoint = '/leaderboard';
  static const String userRankEndpoint = '/rank';
  static const String markTaskEndpoint = '/mark-task';
  static const String userLevelEndpoint = '/update-user-level';
  static const String connectionsEndpoint = '/user/connections';
  static const String googleEndpoint = '/google/login';
  static const String discordEndpoint = '/discord/login';
  static const String xEndpoint = '/x/oauth2/login';
  static const String facebookEndpoint = '/facebook/login';
  static const String spotifyEndpoint = '/spotify/login';
  static const String redditEndpoint = '/reddit/login';
  static const String generateTweetEndpoint = '/tweet/generate';
  static const String saveTweetEndpoint = '/tweet/save';
  static const String fetchTweetsEndpoint = '/tweet/fetch';
  static const String updateTweetStatusEndpoint = '/tweet/status-update';
  static const String cryptoNewsEndpoint = '/news';
  static const String upsertUserPersonalityEndpoint =
      '/user/personality/upsert';
  static const String fetchUserPersonalityEndpoint = '/user/personality/fetch';

  // Local Storage Boxes
  static const String userBox = 'userBox';
  static const String walletsBox = 'walletsBox';
  static const String authBox = 'walletsBox';

  /// Local Storage Keys
  static const String passwordKey = 'password';
  static const String privateKeyKey = 'privateKey';
  static const String publicKeyKey = 'publicKey';
  static const String walletAddressKey = 'walletAddress';
  static const String isLoggedInKey = 'isLoggedIn';
  static const String walletExistsKey = 'walletExists';
  static const String networksKey = 'networks';
  static const String currencyKey = 'currency';
  static const String walletsKey = 'wallets';
  static const String firstNameKey = 'firstName';
  static const String lastNameKey = 'lastName';
  static const String authKey = 'authState';
}
