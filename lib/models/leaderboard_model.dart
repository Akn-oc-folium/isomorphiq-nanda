// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromJson(jsonString);

import 'dart:convert';

Leaderboard leaderboardFromJson(String str) =>
    Leaderboard.fromJson(json.decode(str));

String leaderboardToJson(Leaderboard data) => json.encode(data.toJson());

class Leaderboard {
  final Data data;
  final int code;
  final String message;

  Leaderboard({
    required this.data,
    required this.code,
    required this.message,
  });

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
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
  final List<LeaderBoard> leaderBoard;

  Data({
    required this.leaderBoard,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        leaderBoard: List<LeaderBoard>.from(
            json["leader_board"].map((x) => LeaderBoard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leader_board": List<dynamic>.from(leaderBoard.map((x) => x.toJson())),
      };
}

class LeaderBoard {
  final String name;
  final int points;

  LeaderBoard({
    required this.name,
    required this.points,
  });

  factory LeaderBoard.fromJson(Map<String, dynamic> json) => LeaderBoard(
        name: json["name"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "points": points,
      };
}
