import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_21/Pages/login_page.dart';
import 'package:project_21/Pages/public_chat.dart';
///import 'package:project_21/Pages/email_forgetPassword.dart';
//import 'package:project_21/Pages/login_page.dart';
import 'package:project_21/Pages/splash_screen.dart';
import 'package:project_21/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage(),
    
    );
  }
}
