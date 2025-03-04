// To parse this JSON data, do
//
//     final cryptoNews = cryptoNewsFromJson(jsonString);

import 'dart:convert';

CryptoNews cryptoNewsFromJson(String str) =>
    CryptoNews.fromJson(json.decode(str));

String cryptoNewsToJson(CryptoNews data) => json.encode(data.toJson());

class CryptoNews {
  final List<News>? data;
  final int? code;
  final String? message;

  CryptoNews({
    this.data,
    this.code,
    this.message,
  });

  factory CryptoNews.fromJson(Map<String, dynamic> json) => CryptoNews(
        data: json["data"] == null
            ? []
            : List<News>.from(json["data"]!.map((x) => News.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class News {
  final String? headline;
  final String? source;
  final String? summary;

  News({
    this.headline,
    this.source,
    this.summary,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        headline: json["headline"],
        source: json["source"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "headline": headline,
        "source": source,
        "summary": summary,
      };
}
