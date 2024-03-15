import 'package:flutter/material.dart';

class TypeButtonWidget extends StatelessWidget {
  TypeButtonWidget({this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        text!,
        style: TextStyle(
            fontSize: 25,
            color: Color(0xff4F2638),
            fontFamily: 'ShadowsIntoLightTwo'),
      )),
      width: 100,
      height: 50,
    );
  }
}
