import 'package:flutter/material.dart';


class Message {
    final String message ;
    String id;
  Message(this.message,this.id);
  // Map<String,dynamic> te type of jsondata 
  factory Message.fromJson(jsonData){
    return Message(jsonData['text'],jsonData['id']);

  }
}