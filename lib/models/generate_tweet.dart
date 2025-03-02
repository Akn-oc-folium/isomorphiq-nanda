// To parse this JSON data, do
//
//     final generateTweet = generateTweetFromJson(jsonString);

import 'dart:convert';

GenerateTweet generateTweetFromJson(String str) =>
    GenerateTweet.fromJson(json.decode(str));

String generateTweetToJson(GenerateTweet data) => json.encode(data.toJson());

class GenerateTweet {
  final Data data;
  final int code;
  final String message;

  GenerateTweet({
    required this.data,
    required this.code,
    required this.message,
  });

  factory GenerateTweet.fromJson(Map<String, dynamic> json) => GenerateTweet(
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
  final String content;
  final String news;

  Data({
    required this.content,
    required this.news,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json["content"],
        news: json["news"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "news": news,
      };
}
