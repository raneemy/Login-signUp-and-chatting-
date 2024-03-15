import 'package:flutter/material.dart';
import 'package:project_21/Pages/login_page.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff724252),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset('asset/Splash.png'),
            const Text(
              'BreatheFree',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'ShadowsIntoLightTwo'),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
