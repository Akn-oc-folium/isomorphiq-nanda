// To parse this JSON data, do
//
//     final saveGeneratedTweet = saveGeneratedTweetFromJson(jsonString);

import 'dart:convert';

SaveGeneratedTweet saveGeneratedTweetFromJson(String str) =>
    SaveGeneratedTweet.fromJson(json.decode(str));

String saveGeneratedTweetToJson(SaveGeneratedTweet data) =>
    json.encode(data.toJson());

class SaveGeneratedTweet {
  final Data data;
  final int code;
  final String message;

  SaveGeneratedTweet({
    required this.data,
    required this.code,
    required this.message,
  });

  factory SaveGeneratedTweet.fromJson(Map<String, dynamic> json) =>
      SaveGeneratedTweet(
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
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
