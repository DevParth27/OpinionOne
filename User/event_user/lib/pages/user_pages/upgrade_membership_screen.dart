import 'package:flutter/material.dart';

class TradingDetailsScreen extends StatelessWidget {
  const TradingDetailsScreen({super.key});

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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Trading Account Tiers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FreeCard(
                title: 'Basic Account',
                minDeposit: '\$0 Deposit',
                features: [
                  'Access to market data',
                  'Standard trading fees',
                  'Basic customer support',
                ],
              ),
              SizedBox(height: 20),
              TradingCard(
                title: 'Silver Account',
                minDeposit: '\$500 Minimum Deposit',
                features: [
                  'Lower trading fees',
                  'Priority customer support',
                  'Basic risk analysis tools',
                ],
              ),
              SizedBox(height: 20),
              TradingCard(
                title: 'Gold Account',
                minDeposit: '\$5,000 Minimum Deposit',
                features: [
                  'Exclusive market insights',
                  'Faster withdrawals',
                  'Advanced risk analysis tools',
                ],
              ),
              SizedBox(height: 20),
              TradingCard(
                title: 'Platinum Account',
                minDeposit: '\$25,000 Minimum Deposit',
                features: [
                  'Dedicated account manager',
                  'Zero trading fees',
                  'Personalized investment strategies',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TradingCard extends StatelessWidget {
  final String title;
  final String minDeposit;
  final List<String> features;

  const TradingCard({
    super.key,
    required this.title,
    required this.minDeposit,
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
              minDeposit,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
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
  final String minDeposit;
  final List<String> features;

  const FreeCard({
    super.key,
    required this.title,
    required this.minDeposit,
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
              minDeposit,
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
