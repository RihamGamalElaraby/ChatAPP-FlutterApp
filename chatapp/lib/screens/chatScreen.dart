import 'package:chatapp/Network/FireBaseCodes.dart';
import 'package:chatapp/reusable/ChatBuble.dart';
import 'package:chatapp/reusable/Constant.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  var messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/chat.png',
              height: 50,
            ),
            const Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return const ChatBubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: messagecontroller,
              // onSubmitted: (data) {
              //   firestoreAddMessage(messege: data.toString());
              //   messagecontroller.clear();
              // },
              decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () async {
                      await firestoreAddMessage(
                          messege: messagecontroller.text);
                      messagecontroller.clear();
                    },
                  ),
                  // Icon(Icons.send),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 64, 79, 140)))),
            ),
          ),
        ],
      ),
    );
  }
}
