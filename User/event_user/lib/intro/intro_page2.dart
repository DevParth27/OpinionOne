import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[700]!, Colors.grey[900]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _LottieAnimation(animation: 'assets/videos/page2.json'),
              const SizedBox(height: 20),
              _WelcomeMessage(
                message: 'Automates Manual Tasks Instantly!',
                textColor: Colors.grey[400]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LottieAnimation extends StatelessWidget {
  final String animation;

  const _LottieAnimation({Key? key, required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animation,
      width: 350,
      height: 350,
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  final String message;
  final Color textColor;

  const _WelcomeMessage({
    Key? key,
    required this.message,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
