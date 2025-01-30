import 'package:flutter/material.dart';
import 'dart:io';

void showTermsAndConditionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Terms and Conditions of Bartr Catalyst Group',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        content: const SizedBox(
          height: 300,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '1. Introduction\n\n'
                '1.1. Welcome to Bartr Catalyst Group ("Company," "we," "our," or "us"). These Terms and Conditions ("Terms") govern your use of our services, including our website, mobile applications, and any related platforms (collectively, "Services").\n\n'
                '1.2. By accessing or using our Services, you agree to comply with these Terms. If you do not agree, you must discontinue use immediately.\n\n'
                '1.3. These Terms may be updated from time to time, and users will be notified of significant changes.\n\n'
                '2. Eligibility Criteria\n\n'
                '2.1. You must be at least 18 years old to use our Services. By accessing our platform, you confirm that you meet this age requirement.\n\n'
                '2.2. You must be a resident of India unless specified otherwise.\n\n'
                '2.3. Access to our Services is restricted in states where online real-money gaming or trading is banned (e.g., Andhra Pradesh, Telangana, Assam, Odisha).\n\n'
                '3. User Accounts & Verification (KYC)\n\n'
                '3.1. To access certain features, you may be required to create an account. You are responsible for maintaining the confidentiality of your account credentials.\n\n'
                '3.2. You agree to provide accurate and up-to-date information when creating an account, including mandatory Know Your Customer (KYC) verification (Aadhaar, PAN, Bank details).\n\n'
                '3.3. Any fraudulent activity will lead to account suspension and potential legal action.\n\n'
                '4. Use of Services\n\n'
                '4.1. You agree to use our Services for lawful purposes only and in compliance with these Terms.\n\n'
                '4.2. Prohibited activities include, but are not limited to:\n\n'
                '- Engaging in fraudulent, illegal, or deceptive activities.\n\n'
                '- Attempting to gain unauthorized access to our platform.\n\n'
                '- Disrupting the normal operation of our Services.\n\n'
                '- Misusing or exploiting any part of our platform for personal gain or to harm others.\n\n'
                '- Multi-accounting, match-fixing, or cheating.\n\n'
                '5. Trading or Skill Gaming Rules\n\n'
                '5.1. Our Services may include trading (stocks, crypto, etc.) and skill-based gaming (fantasy sports, rummy, poker, etc.).\n\n'
                '5.2. Rules of engagement, scoring, payouts, and win conditions will be clearly defined on our platform.\n\n'
                '5.3. Disputes in trades or game results will be resolved according to our outlined procedures.\n\n'
                '6. Payments and Transactions\n\n'
                '6.1. Certain Services may require payments. By making a transaction, you agree to the applicable pricing and payment terms.\n\n'
                '6.2. We use third-party payment processors and are not responsible for any payment-related issues beyond our control.\n\n'
                '6.3. Payments are non-refundable except as required by applicable law or explicitly stated in our refund policy.\n\n'
                '6.4. Acceptable payment methods include UPI, Bank Transfer, Cards, and Wallets. Applicable tax deductions (TDS on winnings) will be processed as per the Income Tax Act, 1961.\n\n'
                '6.5. Withdrawal timelines and minimum withdrawal limits will be specified on our platform.\n\n'
                '7. Limitation of Liability\n\n'
                '7.1. We provide our Services on an "as-is" and "as-available" basis. We do not guarantee uninterrupted or error-free Services.\n\n'
                '7.2. To the fullest extent permitted by law, we are not liable for any indirect, incidental, special, or consequential damages arising from your use of our Services, including server downtime, cyber-attacks, or user negligence.\n\n'
                '8. Indemnification\n\n'
                '8.1. You agree to indemnify and hold us harmless from any claims, damages, losses, or expenses arising from your violation of these Terms or misuse of our Services.\n\n'
                '9. Termination\n\n'
                '9.1. We reserve the right to terminate or suspend your access to our Services at any time, with or without cause, without prior notice.\n\n'
                '9.2. You may deactivate your account at any time by contacting our support team.\n\n'
                '9.3. Upon termination, you must cease all use of our Services, and any rights granted to you under these Terms shall immediately terminate.\n\n'
                'For more details, refer to our complete Terms and Conditions on our platform.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: const Text(
              'Close',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Agree',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      );
    },
  );
}
