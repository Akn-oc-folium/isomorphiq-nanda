// To parse this JSON data, do
//
//     final newsArticle = newsArticleFromJson(jsonString);

import 'dart:convert';

NewsArticle newsArticleFromJson(String str) =>
    NewsArticle.fromJson(json.decode(str));

String newsArticleToJson(NewsArticle data) => json.encode(data.toJson());

class NewsArticle {
  final String? title;
  final String? source;
  final String? content;
  final String? imageUrl;
  final String? url;

  NewsArticle({
    this.title,
    this.source,
    this.content,
    this.url,
    this.imageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        title: json["title"] ?? "No title",
        source: json["source"] ?? "Unknown Source",
        content: json["content"] ?? "No content available",
        imageUrl: json["imageUrl"],
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "source": source,
        "content": content,
        "imageUrl": imageUrl,
        "url": url,
      };
}
