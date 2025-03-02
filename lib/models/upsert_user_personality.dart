// To parse this JSON data, do
//
//     final upsertUserPersonality = upsertUserPersonalityFromJson(jsonString);

import 'dart:convert';

UpsertUserPersonality upsertUserPersonalityFromJson(String str) =>
    UpsertUserPersonality.fromJson(json.decode(str));

String upsertUserPersonalityToJson(UpsertUserPersonality data) =>
    json.encode(data.toJson());

class UpsertUserPersonality {
  final Data data;
  final int code;
  final String message;

  UpsertUserPersonality({
    required this.data,
    required this.code,
    required this.message,
  });

  factory UpsertUserPersonality.fromJson(Map<String, dynamic> json) =>
      UpsertUserPersonality(
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
