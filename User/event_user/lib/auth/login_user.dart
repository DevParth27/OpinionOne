// ignore_for_file: unused_local_variable, unused_field, use_build_context_synchronously, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:event_user/widgets/socialIcon.dart';
import 'package:event_user/widgets/textformfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();

  checkBiometric() {}
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility(bool newValue) {
    setState(() {
      obscurePassword = newValue;
    });
  }

  bool _isBiometricAvailable = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> checkBiometric() async {
    try {
      _isBiometricAvailable = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _authenticate(BuildContext context) async {
    bool authenticated = false;

    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the world of Events',
      );
    } catch (e) {
      print(e);
    }

    if (authenticated) {
      // Authentication successful, proceed to next screen or action
      await Navigator.pushNamed(context, '/home');
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text('Biometric Authentication Successful!'),
          );
        },
      );
    }
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        return await _auth.signInWithCredential(credential);
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF001F54), // Deep Navy Blue
              Color(0xFF013A63), // Dark Cyan Blue
              Color(0xFF2A6F97), // Steel Blue
              Color(0xFF61A5C2), // Muted Aquamarine
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              const Row(
                children: [
                  SizedBox(width: 22),
                  Row(
                    children: [
                      Text(
                        'Bartr Group says',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hi!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              buildTextField(
                'Your Email',
                false,
                const Icon(Icons.email),
                emailController,
                null,
              ),
              buildSizedBox(0),
              buildTextField(
                'Password',
                obscurePassword,
                const Icon(Icons.lock),
                passwordController,
                (bool newValue) {
                  togglePasswordVisibility(newValue);
                },
              ),
              buildSizedBox(10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF3C1A5B), // Deep Purple
                            Color(0xFF6A0572), // Rich Plum
                            Color(0xFFA4133C), // Burgundy Red
                            Color(0xFFB85C8E), // Dark Coral Pink
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'L o g i n',
                            style: GoogleFonts.getFont('Roboto').copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const SizedBox(width: 5),
              //       Text(
              //         ' Or',
              //         style: TextStyle(
              //           color: Colors.grey[100],
              //           fontSize: 20,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 14),
              // buildSocialButton(
              //   iconPath: 'assets/images/svgs/google.svg',
              //   text: 'Sign in with Google',
              //   onPressed: () async {
              //     final userCredential = await _signInWithGoogle();
              //     if (userCredential != null) {
              //       Navigator.pushNamed(context, '/home');
              //       print(
              //           'User signed in: ${userCredential.user!.displayName}');
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text(
              //             'Authentication Successful and Updated!\nUser signed in as ${userCredential.user!.displayName}',
              //           ),
              //         ),
              //       );
              //     } else {
              //       print('Sign in failed.');
              //     }
              //   },
              // ),
              // const SizedBox(height: 13),
              // buildSocialButton(
              //   iconPath: 'assets/images/svgs/apple.svg',
              //   text: 'Sign in with Apple',
              //   onPressed: () {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(
              //         content: Text(
              //           'Sorry! This feature is currently unavailable.',
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(height: 13),
              // buildSocialButton(
              //   iconPath: 'assets/images/svgs/finger.svg',
              //   text: 'Login using Biometric',
              //   onPressed: () {
              //     _authenticate(context);
              //   },
              // ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Text(
                      'Don\u0027t have an account ?',
                      style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFFFC107)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      'Forgot Password ?',
                      style: TextStyle(fontSize: 18, color: Color(0xFFE0E0E0)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
