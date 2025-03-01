// To parse this JSON data, do
//
//     final connections = connectionsFromJson(jsonString);

import 'dart:convert';

Connections connectionsFromJson(String str) =>
    Connections.fromJson(json.decode(str));

String connectionsToJson(Connections data) => json.encode(data.toJson());

class Connections {
  final Apps? apps;

  Connections({
    this.apps,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        apps: json["apps"] == null ? null : Apps.fromJson(json["apps"]),
      );

  Map<String, dynamic> toJson() => {
        "apps": apps?.toJson(),
      };
}

class Apps {
  final bool? google;
  final bool? telegram;
  final bool? discord;
  final bool? x;
  final bool? facebook;
  final bool? spotify;
  final bool? reddit;

  Apps({
    this.google,
    this.telegram,
    this.discord,
    this.x,
    this.facebook,
    this.spotify,
    this.reddit,
  });

  factory Apps.fromJson(Map<String, dynamic> json) => Apps(
        google: json["google"],
        telegram: json["telegram"],
        discord: json["discord"],
        x: json["x"],
        facebook: json["facebook"],
        spotify: json["spotify"],
        reddit: json["reddit"],
      );

  Map<String, dynamic> toJson() => {
        "google": google,
        "telegram": telegram,
        "discord": discord,
        "x": x,
        "facebook": facebook,
        "spotify": spotify,
        "reddit": reddit,
      };
}
