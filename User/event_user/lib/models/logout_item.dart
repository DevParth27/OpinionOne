// logout_item.dart
import 'package:flutter/material.dart';
import 'package:event_user/auth/login_user.dart';

class LogoutItem extends StatelessWidget {
  final BuildContext context;

  const LogoutItem({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Show logout confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout :('),
              content: const Text('Are you sure you want to logout?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    ); // Close the dialog
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade800)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  size: 28.0,
                  color: Colors.white,
                ),
                SizedBox(width: 16.0),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
