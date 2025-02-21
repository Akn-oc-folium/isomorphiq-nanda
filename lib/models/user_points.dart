// To parse this JSON data, do
//
//     final userPoints = userPointsFromJson(jsonString);

import 'dart:convert';

UserPoints userPointsFromJson(String str) =>
    UserPoints.fromJson(json.decode(str));

String userPointsToJson(UserPoints data) => json.encode(data.toJson());

class UserPoints {
  final Data data;
  final int code;
  final String message;

  UserPoints({
    required this.data,
    required this.code,
    required this.message,
  });

  factory UserPoints.fromJson(Map<String, dynamic> json) => UserPoints(
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
  final String name;
  final int points;

  Data({
    required this.name,
    required this.points,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "points": points,
      };
}
