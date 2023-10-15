import 'dart:async';

import 'package:chat_voicegpt/constant/image_constant.dart';
import 'package:chat_voicegpt/features/auth/auth_screen/finger_print.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const FingerPrint())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 34, 31),
      body: Center(child: CircleAvatar(child: Image.asset(ImageConstant.splash_Image, height: 40,))),
    );
  }
}
