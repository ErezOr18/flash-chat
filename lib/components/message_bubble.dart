import 'dart:ui';

import 'package:flash_chat_2/components/reciever_message_bubble.dart';
import 'package:flash_chat_2/components/sender_message_bubble.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String msgText;
  final String msgDate;
  final String msgSender;
  final bool isSender;
  const MessageBubble(
      {this.msgText, this.msgDate, this.msgSender, this.isSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: isSender
            ? SenderMessageBubble(msgSender, msgDate, msgText)
            : ReceiverMessageBubble(msgSender, msgDate, msgText));
  }
}
