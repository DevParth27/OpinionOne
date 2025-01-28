import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/userPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class walletPage extends StatefulWidget {
  const walletPage({super.key});

  @override
  State<walletPage> createState() => _walletPageState();
}

class _walletPageState extends State<walletPage> {
  var currentIndex = 0;
  double availableBalance = 0.0;
  List<Map<String, dynamic>> transactionHistory = [];
  final TextEditingController _amountController = TextEditingController();

  // Keys for SharedPreferences
  static const String _balanceKey = 'availableBalance';
  static const String _transactionKey = 'transactionHistory';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load data from SharedPreferences
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      availableBalance =
          prefs.getDouble(_balanceKey) ?? 1000; // Default balance
      transactionHistory =
          _parseTransactionHistory(prefs.getStringList(_transactionKey));
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_balanceKey, availableBalance);
    await prefs.setStringList(
        _transactionKey, _encodeTransactionHistory(transactionHistory));
  }

  // Parse transaction history from SharedPreferences
  List<Map<String, dynamic>> _parseTransactionHistory(
      List<String>? transactions) {
    if (transactions == null) {
      return [
        {'type': 'Deposit', 'amount': 500.00, 'date': '3/10/2024'},
        {'type': 'Withdrawal', 'amount': -200.00, 'date': '3/8/2024'},
        {'type': 'Deposit', 'amount': 1000.00, 'date': '3/5/2024'},
      ];
    }
    return transactions.map((transaction) {
      final parts = transaction.split('|');
      return {
        'type': parts[0],
        'amount': double.parse(parts[1]),
        'date': parts[2],
      };
    }).toList();
  }

  // Encode transaction history for SharedPreferences
  List<String> _encodeTransactionHistory(
      List<Map<String, dynamic>> transactions) {
    return transactions.map((transaction) {
      return '${transaction['type']}|${transaction['amount']}|${transaction['date']}';
    }).toList();
  }

  // Add funds to the wallet
  void _addFunds() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0) {
      setState(() {
        availableBalance += amount;
        transactionHistory.insert(0, {
          'type': 'Deposit',
          'amount': amount,
          'date': _getFormattedDate(),
        });
      });
      _amountController.clear();
      _saveData(); // Save updated data
    }
  }

  // Withdraw funds from the wallet
  void _withdraw() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0 && amount <= availableBalance) {
      setState(() {
        availableBalance -= amount;
        transactionHistory.insert(0, {
          'type': 'Withdrawal',
          'amount': -amount,
          'date': _getFormattedDate(),
        });
      });
      _amountController.clear();
      _saveData(); // Save updated data
    }
  }

  // Get the current date in a formatted string
  String _getFormattedDate() {
    DateTime now = DateTime.now();
    return '${now.month}/${now.day}/${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add funds logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Balance',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '₹${availableBalance.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Funds'),
                    onPressed: _addFunds,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.remove),
                    label: const Text('Withdraw'),
                    onPressed: _withdraw,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Transaction History',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView(
                children: transactionHistory.map((transaction) {
                  return ListTile(
                    leading: Icon(
                      transaction['type'] == 'Deposit'
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: transaction['type'] == 'Deposit'
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text(transaction['type'],
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Text(transaction['date'],
                        style: const TextStyle(color: Colors.grey)),
                    trailing: Text(
                      '₹${transaction['amount'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction['type'] == 'Deposit'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05), // Adjust opacity here
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (index == 0) {
                // Check if the settings icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else {
                setState(() {
                  currentIndex = index;
                });
              }
              if (index == 1) {
                // Check if the settings icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const walletPage()),
                );
              } else {
                setState(() {
                  currentIndex = index;
                });
              }
              if (index == 3) {
                // Check if the settings icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              } else {
                setState(() {
                  currentIndex = index;
                });
              }
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .029,
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // Adjust opacity here
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex
                      ? Colors.white
                      : const Color.fromARGB(95, 137, 133, 133),
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.wallet,
    Icons.bookmark_rounded,
    Icons.person_outline_rounded,
  ];
}
