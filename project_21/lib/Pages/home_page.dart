import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('WELLCOME !!!!!',
        style: TextStyle(
          fontSize: 34,
          fontFamily: 'ShadowsIntoLightTwo',
          color: Color(0xff4F2638),
          ),),
      ),
    );
  }
}
// special