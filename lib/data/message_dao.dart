import 'package:auth_app/data/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Created At: 15/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
///  A [MessageDao] data access object
class MessageDao{
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("messages");
  /// Saving the JSON message to our Cloud Firestore
  void saveMessage(Message message) {
    collectionReference.add(message.toJson());
  }
  /// Retrieving the message data we have stored at the given Cloud Firestore reference
  Stream<QuerySnapshot> getMessageStream() {
    return collectionReference.snapshots();
  }
}