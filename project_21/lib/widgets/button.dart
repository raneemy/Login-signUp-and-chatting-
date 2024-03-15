import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget {
  buttonWidget({this.onTap, this.text});
  String? text;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffD69B9F),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xff4F2638),
              width: 2,
            )),
        width: 360,
        height: 60,
        child: Center(
            child: Text(
          text!,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}
