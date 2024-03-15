import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_21/Pages/home_page.dart';
import 'package:project_21/Pages/user_SignUp.dart';
import 'package:project_21/widgets/button.dart';
import 'package:project_21/widgets/input_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          // backgroundColor: Color(0xffFEFEF2),
          body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'asset/loginLungs.png',
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
                  hintText: 'Enter Your Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 10),
                buttonWidget(
                    text: 'Log in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        try {
                          await logInMethod();
                       //   Navigator.pop(context);

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('logged in !')));
                          setState(() {});
                        } 
                        catch (ex) {
                          // print(ex);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('something went wrong! ')));
                        }
                        isLoading = false;
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }));
                      }
                    }),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    'forget Password',
                    style: TextStyle(
                        //decoration: TextDecoration.underline.,
                        color: Color(0xffE79DBF)),
                  ),
                ),
                const SizedBox(height: 150),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UserSignUpPage();
                    }));
                  },
                  child: buttonWidget(
                    text: 'Sign up',
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> logInMethod() async {
      UserCredential userCredential =await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
