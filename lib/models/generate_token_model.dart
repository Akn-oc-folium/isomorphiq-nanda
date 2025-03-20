// To parse this JSON data, do
//
//     final generateToken = generateTokenFromJson(jsonString);

import 'dart:convert';

GenerateToken generateTokenFromJson(String str) =>
    GenerateToken.fromJson(json.decode(str));

String generateTokenToJson(GenerateToken data) => json.encode(data.toJson());

class GenerateToken {
  final Data? data;
  final int? code;
  final String? message;

  GenerateToken({
    this.data,
    this.code,
    this.message,
  });

  factory GenerateToken.fromJson(Map<String, dynamic> json) => GenerateToken(
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
  final String? jwt;

  Data({
    this.jwt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        jwt: json["jwt"],
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
      };
}
