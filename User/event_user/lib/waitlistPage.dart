import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitlistPage extends StatelessWidget {
  final int waitlistPosition = 3568; // Example waitlist position
  final int totalUsers = 5200;

  const WaitlistPage({super.key}); // Example total users

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme for trading app vibe
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo or Icon
            const Icon(
              Icons.trending_up,
              size: 80,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              "Welcome to Bartr Opinion",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Your trading journey is about to begin!",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 40),

            // Waitlist Position
            Text(
              "Your Position in Waitlist",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 10),

            // Animated Number
            TweenAnimationBuilder(
              tween: IntTween(begin: 0, end: waitlistPosition),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Text(
                  "#$value",
                  style: GoogleFonts.poppins(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Progress Indicator
            LinearProgressIndicator(
              value: waitlistPosition / totalUsers,
              backgroundColor: Colors.grey[800],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              minHeight: 10,
            ),
            const SizedBox(height: 10),

            // Progress Text
            Text(
              "${((waitlistPosition / totalUsers) * 100).toStringAsFixed(1)}% completed",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 40),

            // Loading Animation
            const SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 50.0,
            ),
            const SizedBox(height: 20),

            // Note for User
            Text(
              "Hold tight! We’re working to get you onboard soon.",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[400],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
