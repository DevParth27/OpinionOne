import 'package:flutter/material.dart';

class UpgradeMembershipScreen extends StatelessWidget {
  const UpgradeMembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
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
          'Upgrade Membership',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FreeCard(
                title: 'Free Membership',
                price: '\$0.00/month',
                features: [
                  'Basic Features',
                  '24/7 support',
                  'Create upto 2 events per month',
                ],
              ),
              SizedBox(height: 20),
              MembershipCard(
                title: 'Basic Membership',
                price: '\$2.99/month',
                features: [
                  'can create upto 5 events per month',
                  'Additition Features will be available',
                  'Limited support',
                ],
              ),
              SizedBox(height: 20),
              MembershipCard(
                title: 'Standard Membership',
                price: '\$5.99/month',
                features: [
                  'Access to advanced features',
                  'Priority support',
                  'Can create upto 10 events per month',
                ],
              ),
              SizedBox(height: 20),
              MembershipCard(
                title: 'Premium Membership',
                price: '\$10.99/month',
                features: [
                  'Access to premium & extra features',
                  '24/7 premium support',
                  'Unlimited Event Creator',
                ],
              ),
            ],
          ),
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
      color: const Color.fromARGB(255, 20, 20, 20),
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
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
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
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 102, 77, 177),
                  borderRadius: BorderRadius.circular(50)),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    'Upgrade',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FreeCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;

  const FreeCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 20, 20, 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      surfaceTintColor: const Color.fromARGB(255, 66, 199, 30),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300],
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
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
