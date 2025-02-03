import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PredictionDetailsPage extends StatefulWidget {
  final String description;
  final String endDate;
  final int participants;
  final String price;

  const PredictionDetailsPage({
    super.key,
    required this.description,
    required this.endDate,
    required this.participants,
    required this.price,
  });

  @override
  State<PredictionDetailsPage> createState() => _PredictionDetailsPageState();
}

class _PredictionDetailsPageState extends State<PredictionDetailsPage> {
  double availableBalance = 0.0;
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadWalletData();
  }

  Future<void> _loadWalletData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      availableBalance = prefs.getDouble('availableBalance') ?? 1000.0;
    });
  }

  Future<void> _updateWallet(double amount) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      availableBalance -= amount;
    });
    await prefs.setDouble('availableBalance', availableBalance);

    // Update transaction history
    List<String> transactions = prefs.getStringList('transactionHistory') ?? [];
    transactions.insert(0, 'Bet|$amount|${DateTime.now()}');
    await prefs.setStringList('transactionHistory', transactions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Prediction Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 166, 166),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Ends on: ${widget.endDate}",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.group, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Participants: ${widget.participants}",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.trending_up,
                    color: Colors.lightGreenAccent, size: 20),
                const SizedBox(width: 8),
                Text(
                  "Multiplier: ${widget.price}",
                  style: const TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Available Balance: ₹${availableBalance.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Enter Your Bet Amount:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter amount",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    double betAmount =
                        double.tryParse(amountController.text) ?? 0;
                    if (betAmount > 0 && betAmount <= availableBalance) {
                      _updateWallet(betAmount);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Bet placed: ₹$betAmount"),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(betAmount > availableBalance
                              ? "Insufficient balance."
                              : "Please enter a valid amount."),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Choose Your Bet:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BetButton(
                    title: "Yes",
                    color: Colors.green,
                    amountController: amountController,
                    availableBalance: availableBalance,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: BetButton(
                    title: "No",
                    color: Colors.red,
                    amountController: amountController,
                    availableBalance: availableBalance,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BetButton extends StatelessWidget {
  final String title;
  final Color color;
  final TextEditingController amountController;
  final double availableBalance;

  const BetButton({
    super.key,
    required this.title,
    required this.color,
    required this.amountController,
    required this.availableBalance,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: amountController,
      builder: (context, value, child) {
        double betAmount = double.tryParse(value.text) ?? 0;
        bool isDisabled = betAmount <= 0 || betAmount > availableBalance;

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDisabled ? Colors.grey : color,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: isDisabled ? 0 : 5,
          ),
          onPressed: isDisabled
              ? null
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Bet placed on $title"),
                      duration: const Duration(seconds: 2),
                      backgroundColor: color,
                    ),
                  );
                },
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
