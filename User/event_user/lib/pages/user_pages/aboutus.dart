import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20.0),
            _buildProfileSection(),
            const SizedBox(height: 30.0),
            _buildSectionTitle('About Us'),
            const SizedBox(height: 10.0),
            _buildDescriptionText(
              'At Bartr Catalyst Group (BCG), we empower startups and established companies by offering tailored consulting and strategic solutions. From startup incubations to corporate growth strategies, we are your trusted partner in navigating the complexities of modern business.',
            ),
            const SizedBox(height: 30.0),
            _buildSectionTitle('Contact Us'),
            const SizedBox(height: 10.0),
            _buildContactInfo(),
            const SizedBox(height: 30.0),
            _buildSectionTitle('App Version'),
            const SizedBox(height: 10.0),
            _buildVersionInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserPage()),
            );
          },
          child:
              Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey[300]),
        ),
      ],
    );
  }

  Widget _buildProfileSection() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/images_pages/eventl.jpg'),
        ),
        SizedBox(height: 20.0),
        Text(
          'Bartr Opinion',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Your Trust is our responsibility',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDescriptionText(String description) {
    return Text(
      description,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.email, color: Colors.white),
          title: Text(
            'Email: inrcommunication@gmail.com',
            style: TextStyle(color: Colors.grey[300]),
          ),
          onTap: () {
            // Handle email tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.phone, color: Colors.white),
          title: Text(
            'Phone: +91 8468995302',
            style: TextStyle(color: Colors.grey[300]),
          ),
          onTap: () {
            // Handle phone tap
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on_sharp, color: Colors.white),
          title: Text(
            'Address: Trimurtee Nagar, Nagpur, Maharashtra 440046',
            style: TextStyle(color: Colors.grey[300]),
          ),
          onTap: () {
            // Handle phone tap
          },
        ),
      ],
    );
  }

  Widget _buildVersionInfo() {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/images_pages/time.png',
              color: Colors.white, width: 26, height: 26),
          title: Text(
            'Version: 1.0.7',
            style: TextStyle(color: Colors.grey[300]),
          ),
          onTap: () {
            // Handle version tap
          },
        ),
      ],
    );
  }
}
