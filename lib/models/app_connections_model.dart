// To parse this JSON data, do
//
//     final appConnections = appConnectionsFromJson(jsonString);

import 'dart:convert';

AppConnections appConnectionsFromJson(String str) =>
    AppConnections.fromJson(json.decode(str));

String appConnectionsToJson(AppConnections data) => json.encode(data.toJson());

class AppConnections {
  final Data? data;
  final int? code;
  final String? message;

  AppConnections({
    this.data,
    this.code,
    this.message,
  });

  factory AppConnections.fromJson(Map<String, dynamic> json) => AppConnections(
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
  final bool telegram;
  final bool twitter;
  final bool gmail;
  final bool facebook;
  final bool discord;
  final bool spotify;
  final bool reddit;

  Data({
    required this.telegram,
    required this.twitter,
    required this.gmail,
    required this.facebook,
    required this.discord,
    required this.spotify,
    required this.reddit,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        telegram: json["telegram"],
        twitter: json["twitter"],
        gmail: json["gmail"],
        facebook: json["facebook"],
        discord: json["discord"],
        spotify: json["spotify"],
        reddit: json["reddit"],
      );

  Map<String, dynamic> toJson() => {
        "telegram": telegram,
        "twitter": twitter,
        "gmail": gmail,
        "facebook": facebook,
        "discord": discord,
        "spotify": spotify,
        "reddit": reddit,
      };
}
