// To parse this JSON data, do
//
//     final fetchUserPersonality = fetchUserPersonalityFromJson(jsonString);

import 'dart:convert';

FetchUserPersonality fetchUserPersonalityFromJson(String str) =>
    FetchUserPersonality.fromJson(json.decode(str));

String fetchUserPersonalityToJson(FetchUserPersonality data) =>
    json.encode(data.toJson());

class FetchUserPersonality {
  final Data data;
  final int code;
  final String message;

  FetchUserPersonality({
    required this.data,
    required this.code,
    required this.message,
  });

  factory FetchUserPersonality.fromJson(Map<String, dynamic> json) =>
      FetchUserPersonality(
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
  final int degen;
  final int humor;
  final int storytelling;
  final int optimism;
  final int enthusiasm;

  Data({
    required this.name,
    required this.degen,
    required this.humor,
    required this.storytelling,
    required this.optimism,
    required this.enthusiasm,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        degen: json["degen"],
        humor: json["humor"],
        storytelling: json["storytelling"],
        optimism: json["optimism"],
        enthusiasm: json["enthusiasm"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "degen": degen,
        "humor": humor,
        "storytelling": storytelling,
        "optimism": optimism,
        "enthusiasm": enthusiasm,
      };
}
