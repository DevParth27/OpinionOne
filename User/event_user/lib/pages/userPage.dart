// user_page.dart
import 'package:event_user/models/logout_item.dart';
import 'package:event_user/models/section_header.dart';
import 'package:event_user/models/settings_item.dart';
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
            Navigator.pop(
                context); // Example: Navigating back to the previous screen
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
                child: const Icon(Icons.person, size: 100),
              ),
              const SizedBox(height: 30),
              const Text(
                'ABC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(height: 25),
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
                    const SectionHeader(title: 'Event Manager'),
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
                    const SectionHeader(title: 'Account Settings'),
                    SettingsItem(
                      icon: Icons.person,
                      title: 'Edit Profile',
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
                    const SectionHeader(title: 'App Settings'),
                    SettingsItem(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        // Implement notification settings
                      },
                    ),
                    SettingsItem(
                      icon: Icons.color_lens,
                      title: 'Theme',
                      onTap: () {
                        // Implement theme selection
                      },
                    ),
                    const SectionHeader(title: 'Privacy Settings'),
                    SettingsItem(
                      icon: Icons.location_on,
                      title: 'Location Privacy',
                      onTap: () {
                        // Implement location privacy settings
                      },
                    ),
                    SettingsItem(
                      icon: Icons.visibility,
                      title: 'Hide Profile',
                      onTap: () {
                        // Implement hide profile functionality
                      },
                    ),
                    const SectionHeader(title: 'About'),
                    SettingsItem(
                      icon: Icons.info,
                      title: 'About Us',
                      onTap: () {
                        // Implement about us screen
                      },
                    ),
                    SettingsItem(
                      icon: Icons.feedback,
                      title: 'Send Feedback',
                      onTap: () {
                        // Implement send feedback functionality
                      },
                    ),
                    LogoutItem(context: context),
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
