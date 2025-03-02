// To parse this JSON data, do
//
//     final newsArticle = newsArticleFromJson(jsonString);

import 'dart:convert';

NewsArticle newsArticleFromJson(String str) => NewsArticle.fromJson(json.decode(str));

String newsArticleToJson(NewsArticle data) => json.encode(data.toJson());

class NewsArticle {
    final Data? data;
    final int? code;
    final String? message;

    NewsArticle({
        this.data,
        this.code,
        this.message,
    });

    factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
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
    final String? headline;
    final String? source;
    final String? summary;

    Data({
        this.headline,
        this.source,
        this.summary,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
