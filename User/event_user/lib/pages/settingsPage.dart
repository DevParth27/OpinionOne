import 'package:flutter/material.dart';

// ignore: camel_case_types
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        children: [
          _buildSectionHeader('Account Settings'),
          _buildSettingsItem(Icons.person, 'Edit Profile', () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddProfileScreen()));
          }),
          _buildSettingsItem(Icons.lock, 'Change Password', () {
            // Implement change password functionality
          }),
          _buildSettingsItem(Icons.card_giftcard, 'Upgrade Membership', () {
            // Implement upgrade membership functionality
          }),
          _buildSectionHeader('App Settings'),
          _buildSettingsItem(Icons.notifications, 'Notifications', () {
            // Implement notification settings
          }),
          _buildSettingsItem(Icons.language, 'Language', () {
            // Implement language selection
          }),
          _buildSettingsItem(Icons.color_lens, 'Theme', () {
            // Implement theme selection
          }),
          _buildSectionHeader('Privacy Settings'),
          _buildSettingsItem(Icons.location_on, 'Location Privacy', () {
            // Implement location privacy settings
          }),
          _buildSettingsItem(Icons.visibility, 'Hide Profile', () {
            // Implement hide profile functionality
          }),
          _buildSectionHeader('About'),
          _buildSettingsItem(Icons.info, 'About Us', () {
            // Implement about us screen
          }),
          _buildSettingsItem(Icons.star, 'Rate App', () {
            // Implement rate app functionality
          }),
          _buildSettingsItem(Icons.feedback, 'Send Feedback', () {
            // Implement send feedback functionality
          }),
          _buildSettingsItem(Icons.exit_to_app, 'Logout', () {
            // Implement logout functionality
          }),
        ],
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

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 28.0,
                  color: Colors.black54,
                ),
                const SizedBox(width: 16.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
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
}
