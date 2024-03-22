//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:project_21/models/message.dart';
import 'package:project_21/widgets/bubble_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicChatPage extends StatelessWidget {
    final String email;

  PublicChatPage({required this.email});

  //const PublicChatPage({super.key});
  // it should be inside a listview.builder

  // to access the fire store that i made by the name of collection
  // each collection has a doc , each doc has just one item (one message / user ....)information
  // if the collection doesnt exist this line of code Create and add to this instance
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  // i need a controller to control my text feild ( to clear it after submit )
  TextEditingController controller = TextEditingController();
  // to scroll down the page when send  a message 
  final _controller =ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('createdAt',descending: true).snapshots(),
      //snapshot is the place that holds messages data
      builder: (context, snapshot) {
            if (snapshot.hasData) {
        List<Message> messageList = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messageList.add(Message.fromJson(snapshot.data!.docs[i]));
        }
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                // add back button // true
                //automaticallyImplyLeading: true,
                title: const Text(
                    // i am add any widgets like row
                    'Public Chat '),
                backgroundColor: Colors.white,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                        // not infinte length , i want just length of messages in firebase
                        itemCount: messageList.length,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // to make the messegaes different 
                          return messageList[index].id==email? BubbleChat(
                            message: messageList[index],
                          ): BubbleChatFriend(message: messageList[index]);
                        }),
                  ),
                  Container(
                    color: Color(0xff555454),
                    height: 60,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13), // Adjust padding as needed
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextField(
                        //textAlign: TextAlign.left,
                        // i will use the controller here
                        controller: controller,
                        // to add message on fire store :
                        // also we need on submitted not on tap because not when user write i will send !
                        onSubmitted: (data) {
                          message.add({
                            'text': data,
                            // adding time to order messages based on it 
                            'createdAt' :DateTime.now(),
                            'id':email
                          
                          });
                          controller.clear();
                            //scroll to the end 
                              WidgetsBinding.instance!.addPostFrameCallback((_) {
                            _controller.animateTo(
                              //_controller.position.maxScrollExtent,
                              0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              );
                              });
                        },
                        decoration: InputDecoration(
                          hintText: 'Send message ',
                          suffixIcon: Icon(Icons.send),
                          // hintText: 'Enter text',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true, // Fill the background with color
                          fillColor: Colors.white, // White background color
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded border
                            borderSide: BorderSide.none, // No border side
                          ),
                        ),
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                    ),
                  )
                ],
              ));
        } else {
    return CircularProgressIndicator(); // For example, you can show a loading indicator
        }
      },
    );
  }
}
