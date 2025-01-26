// ignore_for_file: camel_case_types, unused_local_variable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:event_user/auth/login_user.dart';
import 'package:event_user/auth/register_user.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: height * 0.3,
              child: LottieBuilder.asset(
                "assets/videos/Animation - 1737794715631.json",
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: 1.0,
            child: Text(
              'Bartr Opinion',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: height * 0.045,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            'Your trust is our victory',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.w300,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      nextScreen: RegisterPage(),
      animationDuration: const Duration(seconds: 3),
      splashIconSize: height * 0.5,
      backgroundColor: Colors.black87,
    );
  }
}
