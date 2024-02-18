import 'package:flutter/material.dart';

import 'Constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          child: const Text(
            'userrrrrususerrrrruserrrrruserrrrrerrrrruserrrrr',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
