// To parse this JSON data, do
//
//     final userRank = userRankFromJson(jsonString);

import 'dart:convert';

UserRank userRankFromJson(String str) => UserRank.fromJson(json.decode(str));

String userRankToJson(UserRank data) => json.encode(data.toJson());

class UserRank {
  final Data data;
  final int code;
  final String message;

  UserRank({
    required this.data,
    required this.code,
    required this.message,
  });

  factory UserRank.fromJson(Map<String, dynamic> json) => UserRank(
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
  final int rank;

  Data({
    required this.name,
    required this.rank,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["Name"],
        rank: json["Rank"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Rank": rank,
      };
}
