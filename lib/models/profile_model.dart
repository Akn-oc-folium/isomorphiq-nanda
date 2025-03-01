// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  final Data data;
  final int code;
  final String message;

  UserProfile({
    required this.data,
    required this.code,
    required this.message,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
      };
}

class Data {
  final String id;
  final String name;
  final String telegramHandle;
  final String twitterAuthToken;
  final String twitterAuthSecret;
  final String gmailAuthToken;
  final String gmailRefreshToken;
  final DateTime gmailExpiryTime;
  final String facebookAuthToken;
  final String facebookAuthSecret;
  final int points;
  final String chatId;
  final String gameBotChatId;
  final String characterFileLocation;
  final String elizaAgentId;
  final String elizaAgentAddress;
  final String elizaAgentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String taskId;
  final List<AppTask> appTasks;

  Data({
    required this.id,
    required this.name,
    required this.telegramHandle,
    required this.twitterAuthToken,
    required this.twitterAuthSecret,
    required this.gmailAuthToken,
    required this.gmailRefreshToken,
    required this.gmailExpiryTime,
    required this.facebookAuthToken,
    required this.facebookAuthSecret,
    required this.points,
    required this.chatId,
    required this.gameBotChatId,
    required this.characterFileLocation,
    required this.elizaAgentId,
    required this.elizaAgentAddress,
    required this.elizaAgentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.taskId,
    required this.appTasks,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        telegramHandle: json["telegram_handle"],
        twitterAuthToken: json["twitter_auth_token"],
        twitterAuthSecret: json["twitter_auth_secret"],
        gmailAuthToken: json["gmail_auth_token"],
        gmailRefreshToken: json["gmail_refresh_token"],
        gmailExpiryTime: DateTime.parse(json["gmail_expiry_time"]),
        facebookAuthToken: json["facebook_auth_token"],
        facebookAuthSecret: json["facebook_auth_secret"],
        points: json["points"],
        chatId: json["chat_id"],
        gameBotChatId: json["game_bot_chat_id"],
        characterFileLocation: json["character_file_location"],
        elizaAgentId: json["eliza_agent_id"],
        elizaAgentAddress: json["eliza_agent_address"],
        elizaAgentStatus: json["eliza_agent_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        taskId: json["task_id"],
        appTasks: List<AppTask>.from(
            json["app_tasks"].map((x) => AppTask.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "telegram_handle": telegramHandle,
        "twitter_auth_token": twitterAuthToken,
        "twitter_auth_secret": twitterAuthSecret,
        "gmail_auth_token": gmailAuthToken,
        "gmail_refresh_token": gmailRefreshToken,
        "gmail_expiry_time": gmailExpiryTime.toIso8601String(),
        "facebook_auth_token": facebookAuthToken,
        "facebook_auth_secret": facebookAuthSecret,
        "points": points,
        "chat_id": chatId,
        "game_bot_chat_id": gameBotChatId,
        "character_file_location": characterFileLocation,
        "eliza_agent_id": elizaAgentId,
        "eliza_agent_address": elizaAgentAddress,
        "eliza_agent_status": elizaAgentStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "task_id": taskId,
        "app_tasks": List<dynamic>.from(appTasks.map((x) => x.toJson())),
      };
}

class AppTask {
  final String level;
  final List<Assignment> assignments;

  AppTask({
    required this.level,
    required this.assignments,
  });

  factory AppTask.fromJson(Map<String, dynamic> json) => AppTask(
        level: json["level"],
        assignments: List<Assignment>.from(
            json["assignments"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "assignments": List<dynamic>.from(assignments.map((x) => x.toJson())),
      };
}

class Assignment {
  final String assignmentType;
  final String description;
  final bool done;

  Assignment({
    required this.assignmentType,
    required this.description,
    required this.done,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        assignmentType: json["assignment_type"],
        description: json["description"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "assignment_type": assignmentType,
        "description": description,
        "done": done,
      };
}
