import 'package:flutter/material.dart';

class UpgradeMembershipScreen extends StatelessWidget {
  const UpgradeMembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Membership'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MembershipCard(
              title: 'Basic Membership',
              price: '\$9.99/month',
              features: [
                'Access to basic feature 1',
                'Access to basic feature 2',
                'Limited support',
              ],
            ),
            SizedBox(height: 20),
            MembershipCard(
              title: 'Standard Membership',
              price: '\$19.99/month',
              features: [
                'Access to advanced features',
                'Priority support',
                'Additional storage space',
              ],
            ),
            SizedBox(height: 20),
            MembershipCard(
              title: 'Premium Membership',
              price: '\$29.99/month',
              features: [
                'Access to premium features',
                '24/7 premium support',
                'Unlimited storage space',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;

  const MembershipCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              feature,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your logic for upgrading membership here
              },
              child: const Text('Upgrade'),
            ),
          ],
        ),
      ),
    );
  }
}
