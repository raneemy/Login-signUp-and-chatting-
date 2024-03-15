import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:project_21/Pages/Specilaist_SignUp.dart';
//import 'package:project_21/Pages/login_page.dart';
import 'package:project_21/Pages/splash_screen.dart';
//import 'package:project_21/Pages/user_SignUp.dart';
import 'package:project_21/firebase_options.dart';
//import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   'UserSignUpPage' :(context)=> UserSignUpPage(),
      //   'SpecialistSignUpPage' :(context)=> SpecialistSignUpPage()
      // },
      home: Spalsh(),
    );
  }
}
