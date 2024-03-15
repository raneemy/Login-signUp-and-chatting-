import 'package:flutter/material.dart';

class InputFiled extends StatelessWidget {
  InputFiled({this.hintText,this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'Field is required';
        }
      },
      onChanged: onChanged ,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              //fontSize:
              color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff4F2638),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(25.0)
              ),
        ),
      );
  }
}
