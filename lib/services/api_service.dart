import 'package:dio/dio.dart';
import 'package:isomorph_iq/models/profile_model.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/models/leaderboard_model.dart';
import 'package:isomorph_iq/models/post_model.dart';
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

  Future<SignAuth> getGoogleAuthUrl({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.googleEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch google auth!');
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

  Future<SignAuth> getDiscordAuthUrl({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.discordEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch discord auth!');
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

  Future<SignAuth> getXAuthUrl({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.xEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch twitter auth!');
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

  Future<SignAuth> getFacebookAuthUrl({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.facebookEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch facebook auth!');
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

  Future<SignAuth> getSpotifyAuthUrl({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        AppConstants.spotifyEndpoint,
        queryParameters: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        return SignAuth.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to fetch spotify auth!');
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
}
