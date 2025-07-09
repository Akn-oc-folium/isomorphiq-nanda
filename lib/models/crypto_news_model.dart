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
  final String? id;
  final String? headline;
  final String? summary;
  final Source? source;
  final String? imageUrl;

  News({
    this.id,
    this.headline,
    this.summary,
    this.source,
    this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        headline: json["headline"],
        summary: json["summary"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "headline": headline,
        "summary": summary,
        "source": source?.toJson(),
        "image_url": imageUrl,
      };
}

class Source {
  final String? domain;
  final String? url;

  Source({
    this.domain,
    this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        domain: json["domain"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "domain": domain,
        "url": url,
      };
}
