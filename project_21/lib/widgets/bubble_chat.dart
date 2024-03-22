
import 'package:flutter/material.dart';
import 'package:project_21/models/message.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({
    Key? key,
    required this.message
  }): super(key: key);
  final Message message;

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
       // width: 130,
        //alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        //height: 50,
        decoration: const BoxDecoration(
          color: Color(0xffE9AFC7),
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(33),
          topRight: Radius.circular(33),
          bottomLeft: Radius.circular(33)
        )),
        
        child: Text(message.message)
        ),
            );
  }
}


class BubbleChatFriend extends StatelessWidget {
    const BubbleChatFriend({
    Key? key,
    required this.message
  }): super(key: key);
  final Message message;

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
       // width: 130,
        //alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        //height: 50,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(33),
          topRight: Radius.circular(33),
          bottomRight: Radius.circular(33)
        )),
        
        child: Text(message.message)
        ),
            );
  }
}