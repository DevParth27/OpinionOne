// ignore_for_file: unused_local_variable
import 'package:event_user/widgets/socialIcon.dart';
import 'package:flutter/material.dart';
import 'package:event_user/widgets/textformfield.dart';
import 'package:event_user/pages/user_pages/termsCond.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

final _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;

  void togglePasswordVisibility(bool newValue) {
    setState(() {
      obscurePassword = newValue;
    });
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

  Future<void> _registerWithEmail() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Registration Successful! Please log in.')),
        );
        Navigator.pushNamed(context, '/login', arguments: emailController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration Failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 212, 73, 203),
                Color.fromARGB(191, 152, 67, 155),
                Color.fromARGB(255, 7, 13, 40),
                Color(0xFF000000),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const Row(
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
                buildSizedBox(0),
                buildTextField(
                  'Confirm Password',
                  obscurePassword,
                  const Icon(Icons.lock),
                  confirmPasswordController,
                  (bool newValue) {
                    togglePasswordVisibility(newValue);
                  },
                ),
                buildSizedBox(20),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 5),
                      Text(
                        ' Or',
                        style: TextStyle(
                          color: Colors.grey[100],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                buildSizedBox(20),
                buildSocialButton(
                  iconPath: 'assets/images/svgs/google.svg',
                  text: 'Sign in with Google',
                  onPressed: () async {
                    final userCredential = await _signInWithGoogle();
                    if (userCredential != null) {
                      Navigator.pushNamed(context, '/home');
                      print(
                          'User signed in: ${userCredential.user!.displayName}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Authentication Successful and Updated!\nUser signed in as ${userCredential.user!.displayName}',
                          ),
                        ),
                      );
                    } else {
                      print('Sign in failed.');
                    }
                  },
                ),
                const SizedBox(height: 13),
                buildSocialButton(
                  iconPath: 'assets/images/svgs/apple.svg',
                  text: 'Sign in with Apple',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Sorry! This feature is currently unavailable.',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'By selecting Agree & Continue below, I agree to the',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Implement Terms of Services and Privacy Policy
                          showTermsAndConditionsDialog(context);
                        },
                        child: const Text(
                          'Terms of Services and Privacy Policy',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    _registerWithEmail();
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
                              Color.fromARGB(255, 197, 126, 205),
                              Color.fromARGB(255, 173, 66, 102),
                              Color.fromARGB(255, 220, 55, 189),
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'A g r e e   &   C o n t i n u e',
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
