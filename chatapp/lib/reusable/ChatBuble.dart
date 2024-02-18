import 'package:chatapp/models/massegeModel.dart';
import 'package:flutter/material.dart';

import 'Constant.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          // alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          // alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 135, 138, 139),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              )),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
