import 'dart:async';

import 'package:flutter/material.dart';
import 'package:souq_4_shop_online/ui/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()
    {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 65, 130),
      body: Image.asset(
        'assets/images/splashScreen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
