import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_21/widgets/button.dart';
import 'package:project_21/widgets/input_widget.dart';

// ignore: must_be_immutable
class SetEmailPage extends StatelessWidget {
  SetEmailPage({super.key});
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                'Please enter your Email you need to reset :',
                style: TextStyle(color: Color(0xff4F2638)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InputFiled(
              onChanged: (data) {
                email = data;
              },
              hintText: 'E-mail',
            ),
            const SizedBox(
              height: 20,
            ),
            buttonWidget(
              color: Color(0xffD69B9F),
              textcolor: Colors.white,
              text: 'Send Code',
              onTap: () async {
                try {
                  await passwordReset();
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      content: Text('Check your email to change password !'),
                    ),
                  );
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> passwordReset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
  }
}
