import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[200]!,
              const Color.fromARGB(255, 113, 196, 118)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _LottieAnimation(animation: 'assets/videos/page3.json'),
              const SizedBox(height: 20),
              _WelcomeMessage(
                message: 'Instant Efficiency, Command, Witness!',
                textColor: Colors.green[900]!,
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
