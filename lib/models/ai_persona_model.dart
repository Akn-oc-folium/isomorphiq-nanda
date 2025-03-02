// To parse this JSON data, do
//
//     final aiPersona = aiPersonaFromJson(jsonString);

import 'dart:convert';

AiPersona aiPersonaFromJson(String str) => AiPersona.fromJson(json.decode(str));

String aiPersonaToJson(AiPersona data) => json.encode(data.toJson());

class AiPersona {
    final Data? data;
    final int? code;
    final String? message;

    AiPersona({
        this.data,
        this.code,
        this.message,
    });

    factory AiPersona.fromJson(Map<String, dynamic> json) => AiPersona(
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
    Data();

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}
