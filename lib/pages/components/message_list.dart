import 'package:auth_app/data/message.dart';
import 'package:auth_app/data/message_dao.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:auth_app/widgets/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/user_dao.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Created At: 15/ 05/ 2023
///------------------------------------------------------------------

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? email;

  /// Create new message & save that message to our Cloud Firestore
  void _sendMessage(MessageDao messageDao) {
    if (_canSendMessage()) {
      final message = Message(
        text: _messageController.text,
        date: DateTime.now(),
        email: email,
      );
      messageDao.saveMessage(message);
      _messageController.clear();
      setState(() {});
    }
  }

  /// Reactively displaying messages
  Widget _getMessageList(MessageDao dao) {
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: dao.getMessageStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: LinearProgressIndicator());
        }
        return _buildList(context, snapshot.data!.docs);
      },
    ));
  }

  /// Build a list view with scroll controller & some physics
  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  /// Build a list view item
  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final message = Message.fromSnapshot(snapshot);
    return MessageWidget(message.text, message.date, message.email);
  }

  bool _canSendMessage() => _messageController.text.isNotEmpty;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    final messageDao = Provider.of<MessageDao>(context, listen: false);

    final userDao = Provider.of<UserDao>(context, listen: false);
    email = userDao.email();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _getMessageList(messageDao),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _messageController,
                    onSubmitted: (input) {
                      _sendMessage(messageDao);
                    },
                    decoration: InputDecoration(
                        hintText: context.localize("new_message")),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _canSendMessage()
                      ? CupertinoIcons.arrow_right_circle_fill
                      : CupertinoIcons.arrow_right_circle,
                ),
                onPressed: () {
                  _sendMessage(messageDao);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
