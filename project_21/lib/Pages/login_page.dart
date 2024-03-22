import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_21/Pages/email_forgetPassword.dart';
import 'package:project_21/Pages/home_page.dart';
import 'package:project_21/Pages/public_chat.dart';
import 'package:project_21/Pages/user_SignUp.dart';
import 'package:project_21/widgets/button.dart';
import 'package:project_21/widgets/input_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;
  bool isLoading = false;
  

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
                backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    'asset/lungs1.png',
                    width: 160,
                    height: 160,
                  ),
                  const SizedBox(height: 40),
                  InputFiled(
                    hintText: 'Enter Your Email',
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  InputFiled(
                    obscureText: true,
                    hintText: 'Enter Your Password',
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  buttonWidget(
                    text: 'Log in',
                    color: Color(0xffD69B9F),
                    textcolor: Colors.white,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                    
                          await logInMethod();
                          //Navigator.pop(context);
                              // ignore: use_build_context_synchronously
                  //             showDialog(
                  //   context: context,
                  //   builder: (context) => const AlertDialog(
                  //     content: Text('Logged in successfully!'),
                  //   ),
                  // );

                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  PublicChatPage(email: email!,)));
                        } catch (e) {
                            // ignore: use_build_context_synchronously
                            showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(e.toString()),
                    ),
                  );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  SetEmailPage()));
                      },
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(
                          color: Color(0xff4F2638),//Color(0xffE79DBF),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 150),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSignUpPage()));
                    },
                    child: buttonWidget(
                      text: 'Sign up',
                      color: Colors.white,
                      textcolor: Color(0xff4F2638) ,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logInMethod() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
  }
}
