import 'package:event_user/auth/login_user.dart';
import 'package:event_user/auth/register_user.dart';
import 'package:event_user/intro/onboarding_screen.dart';
import 'package:event_user/pages/event_management/create_event.dart';
import 'package:event_user/pages/event_management/event_details.dart';
import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/user_pages/helpNsupport.dart';
import 'package:event_user/pages/user_pages/manageEvents.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const loginPage = LoginPage();
  await loginPage.checkBiometric();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const OnBoardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/eventdetails': (context) => const EventDetails(),
        '/createevent': (context) => const CreateEvent(),
        '/helpnsupport': (context) => const HelpAndSupportPage(),
        '/manageevents': (context) => const ManageEventsPage(),
      },
      home: const OnBoardingScreen(),
    );
  }
}
