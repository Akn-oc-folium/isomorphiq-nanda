import 'dart:convert';

class Tweet {
  final int id;
  final String type; // "Tweet" or "Reply"
  final String content;
  final int creditCost;

  Tweet({
    required this.id,
    required this.type,
    required this.content,
    required this.creditCost,
  });

  // Convert JSON response to Tweet object
  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'] ?? 0,
      type: json['type'] ?? 'Tweet',
      content: json['content'] ?? '',
      creditCost: json['creditCost'] ?? 0,
    );
  }

  // Convert Tweet object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'content': content,
      'creditCost': creditCost,
    };
  }

  // Convert List of JSON objects to List of Tweet objects
  static List<Tweet> fromJsonList(String responseBody) {
    final List<dynamic> parsed = jsonDecode(responseBody);
    return parsed.map((json) => Tweet.fromJson(json)).toList();
  }
}
