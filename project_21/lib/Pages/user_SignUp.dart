import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_21/Pages/Specilaist_SignUp.dart';
import 'package:project_21/widgets/breatheFree_text.dart';
import 'package:project_21/widgets/button.dart';
import 'package:project_21/widgets/input_widget.dart';
import 'package:project_21/widgets/types.dart';

class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({super.key});

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
              backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        //backgroundColor:Color(0xffFEFEF2),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: BreatheFreeText(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TypeButtonWidget(
                      text: 'User'),
                  ],
                ),
                InputFiled(hintText: 'Name'),
                const SizedBox(
                  height: 11,
                ),
                InputFiled(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'E-mail',
                ),
                const SizedBox(
                  height: 11,
                ),
                InputFiled(
                    onChanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    hintText: 'Password'),
                const SizedBox(
                  height: 11,
                ),
                InputFiled(hintText: 'Cigarette Packet Price'),
                const SizedBox(
                  height: 11,
                ),
                InputFiled(hintText: 'Town'),
                const SizedBox(
                  height: 11,
                ),
                buttonWidget(
                    color: Color(0xffD69B9F),
                    textcolor: Colors.white,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        try {
                          await SignUpMethod();
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context); //back to login
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('account created!')));
                          setState(() {});
                        } on FirebaseAuthException catch (ex) {
                          // print(ex);
                          if (ex.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Weak Password!!')));
                          } else if (ex.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Email already in use !')));
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Create'),
                const SizedBox(
                  height: 11,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SepcialistSignUpPage();
                    }));
                  },
                  child: const Center(
                    child: Text(
                      'SignUp as a Specialist!',
                      style: TextStyle(
                          //decoration: TextDecoration.underline.,
                          color: Color(0xffE79DBF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> SignUpMethod() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
