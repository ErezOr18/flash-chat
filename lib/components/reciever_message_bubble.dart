import 'package:flutter/material.dart';

class ReceiverMessageBubble extends StatelessWidget {
  final String msgSender, msgDate, msgText;

  const ReceiverMessageBubble(this.msgSender, this.msgDate, this.msgText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msgSender,
          style: TextStyle(fontSize: 10.0, color: Colors.black54),
        ),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              '$msgText\nat $msgDate',
              style: TextStyle(fontSize: 12.0, color: Colors.black),
            ),
          ),
          color: Colors.white,
        ),
      ],
    );
  }
}
