import 'package:cloud_firestore/cloud_firestore.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Created At: 15/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
///  A [Message] data model
class Message {
  final String text;
  final DateTime date;
  final String? email;

  DocumentReference? reference;

  Message({
    required this.text,
    required this.date,
    this.email,
    this.reference,
  });

  /// JSON converters: Transform the JSON into a [Message] instance
  factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        text: json['text'] as String,
        date: DateTime.parse(json['date'] as String),
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date.toString(),
        'text': text,
        'email': email,
      };

  /// Transform a [Message] instance into JSON
  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    final message = Message.fromJson(snapshot.data() as Map<String, dynamic>);
    message.reference = snapshot.reference;
    return message;
  }
}
