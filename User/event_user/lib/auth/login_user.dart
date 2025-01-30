// ignore_for_file: unused_local_variable, unused_field, use_build_context_synchronously, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? prefilledEmail =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (prefilledEmail != null) {
      emailController.text = prefilledEmail;
    }
  }

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed: $e')),
      );
    }
  }

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
              const SizedBox(height: 100),
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
              const SizedBox(height: 15),
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
                  _login();
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
              const SizedBox(height: 15),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: Colors.grey[400],
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildCard('Active Predictions', '24',
                              Icons.show_chart, Colors.blue),
                        ),
                        const SizedBox(
                            width: 16), // Space between the two cards
                        Expanded(
                          child: _buildCard('Total Users', '1.2k', Icons.groups,
                              Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16), // Space between rows
                    _buildCard('Trading Volume', '\$45.3k', Icons.trending_up,
                        Colors.purple),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      String title, String value, IconData icon, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 212, 212),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              Icon(
                icon,
                color: iconColor,
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
