import 'package:flutter/material.dart';
import 'package:project_21/models/message.dart';
import 'package:project_21/widgets/bubble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicChatPage extends StatelessWidget {
  final String email;

  PublicChatPage({required this.email});

  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  // to take control of text feild 
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Public Chat'),
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? BubbleChat(message: messageList[index])
                          : BubbleChatFriend(message: messageList[index]);
                    },
                  ),
                ),
                Container(
                  color: Color(0xff555454),
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorHeight: 8,
                              cursorWidth: 2,
                              controller: controller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Send message',
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Gets the text from the TextField and removes leading and trailing whitespace.
                              String messageText = controller.text.trim();
                              if (messageText.isNotEmpty) {
                                message.add({
                                  'text': messageText,
                                  'createdAt': DateTime.now(),
                                  'id': email,
                                });
                                controller.clear();
                                WidgetsBinding.instance!
                                    .addPostFrameCallback((_) {
                                  _controller.animateTo(
                                    0,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(Icons.send,
                              color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
