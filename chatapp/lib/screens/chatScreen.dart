import 'package:chatapp/Network/FireBaseCodes.dart';
import 'package:chatapp/models/massegeModel.dart';
import 'package:chatapp/reusable/ChatBuble.dart';
import 'package:chatapp/reusable/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  var messagecontroller = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt', descending: true).snapshots(),
        // future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
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
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleForFriend(
                                  message: messagesList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: messagecontroller,
                      // onSubmitted: (data) {
                      //   firestoreAddMessage(message: data.toString());
                      //   messagecontroller.clear();
                      // },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () async {
                              await firestoreAddMessage(
                                  email: email,
                                  message: messagecontroller.text);
                              messagecontroller.clear();
                              // _controller
                              // .ju/mpTo(_controller.position.minScrollExtent);

                              _controller.animateTo(0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
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
          } else {
            return Text('Loading');
          }
        });
  }
}
