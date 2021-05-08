import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  const MessageStream({
    @required final FirebaseFirestore firestore,
    @required this.userEmail,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('sent_time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            reverse: true,
            children: messages.map((message) {
              final msgText = message.data()['text'];
              final msgSender = message.data()['sender'];
              final DateTime msgTime = message.data()['sent_time'].toDate();
              final msgDate =
                  '${msgTime.year}/${msgTime.month}/${msgTime.day} ${msgTime.hour}:${msgTime.minute}';
              return MessageBubble(
                msgText: msgText,
                msgSender: msgSender,
                msgDate: msgDate,
                isSender: userEmail == msgSender,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
