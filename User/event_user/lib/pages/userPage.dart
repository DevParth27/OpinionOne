// ignore_for_file: file_names

import 'package:event_user/auth/login_user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            // Navigate to home page
            Navigator.pop(
                context); // Example: Navigating back to the previous screen
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: const Icon(Icons.person, size: 100),
              ),
              const SizedBox(height: 30),
              const Text(
                'User Page',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 50),
              Divider(
                height: 1.5,
                thickness: 1,
                color: Colors.grey[400],
                indent: 10, // Left padding
                endIndent: 10, // Right padding
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16.0),
                  children: [
                    _buildSectionHeader('Account Settings'),
                    _buildSettingsItem(Icons.person, 'Edit Profile', () {
                      // Implement edit profile functionality
                    }),

                    _buildSettingsItem(
                        Icons.card_giftcard, 'Upgrade Membership', () {
                      // Implement upgrade membership functionality
                    }),
                    _buildSectionHeader('App Settings'),
                    _buildSettingsItem(Icons.notifications, 'Notifications',
                        () {
                      // Implement notification settings
                    }),

                    _buildSettingsItem(Icons.color_lens, 'Theme', () {
                      // Implement theme selection
                    }),
                    _buildSectionHeader('Privacy Settings'),
                    _buildSettingsItem(Icons.location_on, 'Location Privacy',
                        () {
                      // Implement location privacy settings
                    }),
                    _buildSettingsItem(Icons.visibility, 'Hide Profile', () {
                      // Implement hide profile functionality
                    }),
                    _buildSectionHeader('About'),
                    _buildSettingsItem(Icons.info, 'About Us', () {
                      // Implement about us screen
                    }),

                    _buildSettingsItem(Icons.feedback, 'Send Feedback', () {
                      // Implement send feedback functionality
                    }),
                    //    _buildSettingsItem(Icons.exit_to_app, 'Logout', () {
                    _buildLogoutItem(context),
                    //    }),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Copyright © 2024. All rights reserved.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade800)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 28.0,
                color: Colors.white,
              ),
              const SizedBox(width: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20.0,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

Widget _buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    ),
  );
}

Widget _buildLogoutItem(BuildContext context) {
  return InkWell(
    onTap: () {
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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
