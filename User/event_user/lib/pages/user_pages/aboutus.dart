import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserPage()),
                    );
                  },
                  child: Icon((Icons.arrow_back_ios_new_rounded),
                      color: Colors.grey[300]),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const CircleAvatar(
              radius: 80.0,
              backgroundImage:
                  AssetImage('assets/images/images_pages/eventlogo.jpeg'),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'EventoFactor',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Your Ultimate Event Management Partner',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Eventify is a cutting-edge event management app designed to simplify the process of organizing and managing events of all sizes. Our mission is to empower event organizers with powerful tools and resources to create memorable experiences for their attendees.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.white),
              title: Text(
                'Email: info@eventofactor.com',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
              onTap: () {
                // Action for tapping on email
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.white),
              title: Text(
                'Phone: +1234567890',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
              onTap: () {
                // Action for tapping on phone number
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              'App Version',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            ListTile(
              leading: Image.asset('assets/images/images_pages/time.png',
                  color: Colors.white, width: 26, height: 26),
              title: Text(
                'Version : 1.0.0',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
              onTap: () {
                // Action for tapping on email
              },
            ),
            ListTile(
              leading: Image.asset('assets/images/images_pages/update.png',
                  color: Colors.white, width: 26, height: 26),
              title: Text(
                'Last Updated : April 22, 2024',
                style: TextStyle(
                  color: Colors.grey[300],
                ),
              ),
              onTap: () {
                // Action for tapping on email
              },
            ),
          ],
        ),
      ),
    );
  }
}
