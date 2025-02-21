// To parse this JSON data, do
//
//     final googleSign = googleSignFromJson(jsonString);

import 'dart:convert';

GoogleSign googleSignFromJson(String str) =>
    GoogleSign.fromJson(json.decode(str));

String googleSignToJson(GoogleSign data) => json.encode(data.toJson());

class GoogleSign {
  final Data data;
  final int code;
  final String message;

  GoogleSign({
    required this.data,
    required this.code,
    required this.message,
  });

  factory GoogleSign.fromJson(Map<String, dynamic> json) => GoogleSign(
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
