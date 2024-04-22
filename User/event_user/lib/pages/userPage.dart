// user_page.dart
import 'package:event_user/models/logout_item.dart';
import 'package:event_user/models/settings_item.dart';
import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/user_pages/edit_profile.dart';
import 'package:event_user/pages/user_pages/upgrade_membership_screen.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'User',
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
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.person, size: 75),
              ),
              const SizedBox(height: 22),
              const Text(
                'ABC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  );
                },
                child: Container(
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Divider(
                height: 1.5,
                thickness: 1,
                color: Colors.grey[400],
                indent: 10, // Left padding
                endIndent: 10, // Right padding
              ),
              const SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  children: [
                    SettingsItem(
                      icon: Icons.event,
                      title: 'Manage Events',
                      onTap: () {
                        // Implement edit profile functionality
                      },
                    ),
                    SettingsItem(
                      icon: Icons.online_prediction_rounded,
                      title: 'Booking History',
                      onTap: () {
                        // Implement edit profile functionality
                      },
                    ),
                    SettingsItem(
                      icon: Icons.card_giftcard,
                      title: 'Upgrade Membership',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UpgradeMembershipScreen(),
                          ),
                        );
                      },
                    ),
                    SettingsItem(
                      icon: Icons.info,
                      title: 'About Us',
                      onTap: () {
                        // Implement about us screen
                      },
                    ),
                    const SizedBox(height: 15),
                    Divider(
                      height: 1.5,
                      thickness: 1,
                      color: Colors.grey[400],
                      indent: 10, // Left padding
                      endIndent: 10, // Right padding
                    ),
                    const SizedBox(height: 15),
                    SettingsItem(
                      icon: Icons.feedback,
                      title: 'Help & Support',
                      onTap: () {
                        // Implement send feedback functionality
                      },
                    ),
                    LogoutItem(context: context),
                    const SizedBox(height: 110),
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
