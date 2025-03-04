// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  final Data? data;
  final int? code;
  final String? message;

  UserProfile({
    this.data,
    this.code,
    this.message,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "code": code,
        "message": message,
      };
}

class Data {
  final String? id;
  final String? name;
  final String? telegramHandle;
  final String? twitterAuthToken;
  final String? twitterAuthSecret;
  final String? gmailAuthToken;
  final String? gmailRefreshToken;
  final DateTime? gmailExpiryTime;
  final String? facebookAuthToken;
  final String? facebookAuthSecret;
  final String? spotifyAuthToken;
  final String? discordAuthToken;
  final int? points;
  final String? chatId;
  final String? gameBotChatId;
  final String? characterFileLocation;
  final String? elizaAgentId;
  final String? elizaAgentAddress;
  final String? elizaAgentStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? taskId;
  final dynamic appTasks;
  final int? level;

  Data({
    this.id,
    this.name,
    this.telegramHandle,
    this.twitterAuthToken,
    this.twitterAuthSecret,
    this.gmailAuthToken,
    this.gmailRefreshToken,
    this.gmailExpiryTime,
    this.facebookAuthToken,
    this.facebookAuthSecret,
    this.spotifyAuthToken,
    this.discordAuthToken,
    this.points,
    this.chatId,
    this.gameBotChatId,
    this.characterFileLocation,
    this.elizaAgentId,
    this.elizaAgentAddress,
    this.elizaAgentStatus,
    this.createdAt,
    this.updatedAt,
    this.taskId,
    this.appTasks,
    this.level,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        telegramHandle: json["telegram_handle"],
        twitterAuthToken: json["twitter_auth_token"],
        twitterAuthSecret: json["twitter_auth_secret"],
        gmailAuthToken: json["gmail_auth_token"],
        gmailRefreshToken: json["gmail_refresh_token"],
        gmailExpiryTime: json["gmail_expiry_time"] == null
            ? null
            : DateTime.parse(json["gmail_expiry_time"]),
        facebookAuthToken: json["facebook_auth_token"],
        facebookAuthSecret: json["facebook_auth_secret"],
        spotifyAuthToken: json["spotify_auth_token"],
        discordAuthToken: json["discord_auth_token"],
        points: json["points"],
        chatId: json["chat_id"],
        gameBotChatId: json["game_bot_chat_id"],
        characterFileLocation: json["character_file_location"],
        elizaAgentId: json["eliza_agent_id"],
        elizaAgentAddress: json["eliza_agent_address"],
        elizaAgentStatus: json["eliza_agent_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        taskId: json["task_id"],
        appTasks: json["app_tasks"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "telegram_handle": telegramHandle,
        "twitter_auth_token": twitterAuthToken,
        "twitter_auth_secret": twitterAuthSecret,
        "gmail_auth_token": gmailAuthToken,
        "gmail_refresh_token": gmailRefreshToken,
        "gmail_expiry_time": gmailExpiryTime?.toIso8601String(),
        "facebook_auth_token": facebookAuthToken,
        "facebook_auth_secret": facebookAuthSecret,
        "spotify_auth_token": spotifyAuthToken,
        "discord_auth_token": discordAuthToken,
        "points": points,
        "chat_id": chatId,
        "game_bot_chat_id": gameBotChatId,
        "character_file_location": characterFileLocation,
        "eliza_agent_id": elizaAgentId,
        "eliza_agent_address": elizaAgentAddress,
        "eliza_agent_status": elizaAgentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "task_id": taskId,
        "app_tasks": appTasks,
        "level": level,
      };
}
