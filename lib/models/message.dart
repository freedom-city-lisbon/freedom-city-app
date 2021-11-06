import 'dart:convert';

extension MessageList on List<Message> {
  static List<Message> fromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromMap(x)));
}

class Message {

  String title;
  String body;

  Message({
    required this.title,
    required this.body,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
    title: json["title"],
    body: json["body"],
  );

  factory Message.fromJson(String str) => Message.fromMap(json.decode(str));
}
