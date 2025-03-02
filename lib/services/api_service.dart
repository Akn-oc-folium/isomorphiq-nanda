import 'package:dio/dio.dart';
import 'package:isomorph_iq/models/fetch_tweets.dart';
import 'package:isomorph_iq/models/fetch_user_personality.dart';
import 'package:isomorph_iq/models/generate_tweet.dart';
import 'package:isomorph_iq/models/news_article_model.dart';
import 'package:isomorph_iq/models/profile_model.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/models/leaderboard_model.dart';
import 'package:isomorph_iq/models/post_model.dart';
import 'package:isomorph_iq/models/save_generated_tweet.dart';
import 'package:isomorph_iq/models/upsert_user_personality.dart';
import 'package:isomorph_iq/models/user_points.dart';
import 'package:isomorph_iq/models/user_rank_model.dart';
import 'package:isomorph_iq/services/api_client.dart';
import 'package:isomorph_iq/services/api_exceptions.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';

class ApiService {
  ApiClient apiClient = ApiClient();

  Future<UserProfile> getDashboard({
    required String username,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.dashboardEndpoint,
        queryParameters: {
          'user_name': username,
        },
      );
      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the dashbord!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }

  Future<PostResponse> postUserPoints({
    required String username,
    required int points,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.userPointsEndpoint,
        data: {
          'name': username,
          'points': points,
        },
      );
      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to post points');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<UserPoints> getUserPoints({
    required String username,
  }) async {
    try {
      final Response response = await apiClient.get(
        AppConstants.userPointsEndpoint,
        queryParameters: {
          'user_name': username,
        },
      );
      if (response.statusCode == 200) {
        return UserPoints.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch user points!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Leaderboard> getLeaderboard() async {
    try {
      final Response response = await apiClient.get(
        AppConstants.leaderboardEndpoint,
      );
      if (response.statusCode == 200) {
        return Leaderboard.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Faild to fetch the leaderboard!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserRank> getUserRank({
    required String username,
  }) async {
    try {
      final Response response = await apiClient.get(
        AppConstants.userRankEndpoint,
        queryParameters: {
          'user_name': username,
        },
      );
      if (response.statusCode == 200) {
        return UserRank.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the user rank!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<PostResponse> postMarkTask({
    required String username,
    required String level,
    required String assignmentType,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.markTaskEndpoint,
        data: {
          "name": username,
          "level": level,
          "assignment_type": assignmentType,
        },
      );
      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to mark task!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<PostResponse> postUserLevel({
    required String username,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.userLevelEndpoint,
        data: {
          "name": username,
        },
      );
      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update user\'s level!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<SignAuth> getAppAuthUrl({
    required String appId,
    required String userId,
    required String urlEndPoint,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        urlEndPoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to $appId auth!');
      }
    } catch (e) {
      String errorMessage;
      if (e is DioException) {
        errorMessage = DioExceptions.fromDioError(e).toString();
      } else {
        errorMessage = 'An unexpected error occurred: ${e.toString()}';
      }
      throw errorMessage;
    }
  }

  Future<GenerateTweet> postGenerateTweet({
    required String userId,
    required String topic,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.generateTweetEndpoint,
        queryParameters: {
          "user_id": userId,
        },
        data: {
          "topic": topic,
        },
      );
      if (response.statusCode == 200) {
        return GenerateTweet.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to generate tweet');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<SaveGeneratedTweet> saveGeneratedTweet(
      {required String userId,
      required String content,
      required String tweetStatus}) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.saveGeneratedTweet,
        queryParameters: {
          "user_id": userId,
        },
        data: {"content": content, "tweet_status": tweetStatus},
      );
      if (response.statusCode == 200) {
        return SaveGeneratedTweet.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to save generated tweet');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<FetchTweets> fetchTweets({
    required String userId,
    required String tweetStatus,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.fetchTweets,
        data: {
          "user_id": userId,
          "tweet_status": tweetStatus,
          "order_by": "created_at",
          "order_option": "asc",
          "page_size": 10
        },
      );
      if (response.statusCode == 200) {
        return FetchTweets.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch tweets');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<SaveGeneratedTweet> updateTweetStatus(
      {required String userId,
      required String tweetId,
      required String tweetStatus}) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.saveGeneratedTweet,
        queryParameters: {
          "user_id": userId,
        },
        data: {"tweet_id": tweetId, "tweet_status": tweetStatus},
      );
      if (response.statusCode == 200) {
        return SaveGeneratedTweet.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update generated tweet status');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<NewsArticle> getCryptoNews({
    required String userId,
  }) async {
    try {
      final Response response = await apiClient.get(
        AppConstants.cryptoNewsEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return NewsArticle.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch the crypto news!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<PostResponse> postAiPersona({
    required String username,
    required String level,
    required String assignmentType,
  }) async {
    try {
      final Response response = await apiClient.post(
        AppConstants.markTaskEndpoint,
        data: {
          "name": username,
          "level": level,
          "assignment_type": assignmentType,
        },
      );
      if (response.statusCode == 200) {
        return PostResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to mark task!');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<FetchUserPersonality> fetchUserPersonality({
    required String userId,
  }) async {
    try {
      final Response response = await apiClient.get(
        AppConstants.upsertUserPersonality,
        queryParameters: {
          "user_id": userId,
        },
      );
      if (response.statusCode == 200) {
        return FetchUserPersonality.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch user personality');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }

  Future<UpsertUserPersonality> upsertUserPersonality(
      {required String userId,
      required Map<String, double> sliderValues}) async {
    try {
      Map<String, dynamic> apiBody = {};
      sliderValues.forEach((key, value) {
        apiBody[key.toLowerCase()] = value;
      });
      final Response response = await apiClient.post(
        AppConstants.upsertUserPersonality,
        queryParameters: {
          "user_id": userId,
        },
        data: apiBody,
      );
      if (response.statusCode == 200) {
        return UpsertUserPersonality.fromJson(
            response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to upsert user personality');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw Exception(errorMessage);
    }
  }
}
