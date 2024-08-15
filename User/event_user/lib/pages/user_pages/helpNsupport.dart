import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Help & Support',
          style: TextStyle(
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey[300]),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            _buildSectionTitle('Frequently Asked Questions'),
            const SizedBox(height: 10.0),
            _buildFAQCard(
              question: 'How to reset my password?',
              answer:
                  'You can reset your password by going to the settings page and selecting "Reset Password". An email will be sent to your registered email address with instructions.',
            ),
            _buildFAQCard(
              question: 'How can I contact customer support?',
              answer:
                  'You can reach out to our customer support team via the "Help and Support" section or by emailing info@eventofactor.com.',
            ),
            _buildFAQCard(
              question: 'How do I update my profile information?',
              answer:
                  'To update your profile information, navigate to the "Edit Profile" section in the settings. Make the necessary changes and save them.',
            ),
            const SizedBox(height: 30.0),
            _buildSectionTitle('Contact Us'),
            const SizedBox(height: 10.0),
            _buildContactOption(
              icon: Icons.email,
              title: 'Email Us',
              subtitle: 'info@eventofactor.com',
              onTap: () {
                // Add email action
              },
            ),
            _buildContactOption(
              icon: Icons.phone,
              title: 'Call Us',
              subtitle: '+91 9511827732',
              onTap: () {
                // Add call action
              },
            ),
            _buildContactOption(
              icon: Icons.chat_bubble,
              title: 'Live Chat',
              subtitle: 'Inform us via Feedback, We will reach you soon',
              onTap: () {
                // Add live chat action
              },
            ),
            const SizedBox(height: 30.0),
            _buildSectionTitle('Feedback'),
            const SizedBox(height: 10.0),
            _buildFeedbackForm(screenWidth),
            const SizedBox(height: 20.0),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildFAQCard({required String question, required String answer}) {
    return Card(
      color: const Color.fromARGB(255, 30, 30, 30),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              answer,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 40, 40, 40),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueAccent, size: 30.0),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackForm(double screenWidth) {
    return Column(
      children: [
        _buildTextField('Your Name'),
        const SizedBox(height: 10.0),
        _buildTextField('Your Email'),
        const SizedBox(height: 10.0),
        _buildTextField('Your Feedback', maxLines: 5),
      ],
    );
  }

  Widget _buildTextField(String hintText, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color.fromARGB(255, 30, 30, 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Submit feedback action
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      child: const Text(
        'Submit Feedback',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
