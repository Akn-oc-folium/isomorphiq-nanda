// To parse this JSON data, do
//
//     final fetchTweets = fetchTweetsFromJson(jsonString);

import 'dart:convert';

Tweets fetchTweetsFromJson(String str) => Tweets.fromJson(json.decode(str));

String fetchTweetsToJson(Tweets data) => json.encode(data.toJson());

class Tweets {
  final List<Tweet>? data;
  final int code;
  final String message;

  Tweets({
    required this.data,
    required this.code,
    required this.message,
  });

  factory Tweets.fromJson(Map<String, dynamic> json) => Tweets(
        data: List<Tweet>.from(json["data"].map((x) => Tweet.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class Tweet {
  final String id;
  final String userId;
  final String tweetContent;
  final String tweetStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Tweet({
    required this.id,
    required this.userId,
    required this.tweetContent,
    required this.tweetStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        id: json["id"],
        userId: json["user_id"],
        tweetContent: json["tweet_content"],
        tweetStatus: json["tweet_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "tweet_content": tweetContent,
        "tweet_status": tweetStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
