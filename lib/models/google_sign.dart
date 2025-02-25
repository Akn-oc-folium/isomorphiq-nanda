// To parse this JSON data, do
//
//     final googleSign = googleSignFromJson(jsonString);

import 'dart:convert';

SignAuth googleSignFromJson(String str) => SignAuth.fromJson(json.decode(str));

String googleSignToJson(SignAuth data) => json.encode(data.toJson());

class SignAuth {
  final Data data;
  final int code;
  final String message;

  SignAuth({
    required this.data,
    required this.code,
    required this.message,
  });

  factory SignAuth.fromJson(Map<String, dynamic> json) => SignAuth(
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
  final String link;

  Data({
    required this.link,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}
