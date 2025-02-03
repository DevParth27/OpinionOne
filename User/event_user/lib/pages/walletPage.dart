import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/userPage.dart';
import 'package:event_user/pages/user_pages/development.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double availableBalance = 0.0;
  int currentIndex = 0;
  List<Map<String, Object>> transactionHistory = [];
  final TextEditingController _amountController = TextEditingController();

  static const String _balanceKey = 'availableBalance';
  static const String _transactionKey = 'transactionHistory';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      availableBalance = prefs.getDouble(_balanceKey) ?? 1100;
      transactionHistory =
          _parseTransactionHistory(prefs.getStringList(_transactionKey));
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_balanceKey, availableBalance);
    await prefs.setStringList(
        _transactionKey, _encodeTransactionHistory(transactionHistory));
  }

  /// Fix: Ensure parsing returns `List<Map<String, Object>>` instead of `List<Map<String, dynamic>>`
  List<Map<String, Object>> _parseTransactionHistory(
      List<String>? transactions) {
    if (transactions == null) return [];
    return transactions.map((transaction) {
      final parts = transaction.split('|');
      return {
        'type': parts[0],
        'amount': double.parse(parts[1]), // Ensure amount is a double
        'date': parts[2]
      };
    }).toList();
  }

  /// Fix: Ensure only `List<String>` is stored in `SharedPreferences`
  List<String> _encodeTransactionHistory(
      List<Map<String, Object>> transactions) {
    return transactions.map((transaction) {
      return '${transaction['type']}|${transaction['amount']}|${transaction['date']}';
    }).toList();
  }

  void _addFunds() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0) {
      setState(() {
        availableBalance += amount;
        transactionHistory.insert(0,
            {'type': 'Deposit', 'amount': amount, 'date': _getFormattedDate()});
      });
      _amountController.clear();
      _saveData();
    }
  }

  void _withdrawFunds() {
    double amount = double.tryParse(_amountController.text) ?? 0;
    if (amount > 0 && amount <= availableBalance) {
      setState(() {
        availableBalance -= amount;
        transactionHistory.insert(0, {
          'type': 'Withdrawal',
          'amount': -amount,
          'date': _getFormattedDate()
        });
      });
      _amountController.clear();
      _saveData();
    }
  }

  String _getFormattedDate() {
    DateTime now = DateTime.now();
    return '${now.month}/${now.day}/${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Wallet', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Available Balance',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
              Text('₹${availableBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent)),
              const SizedBox(height: 20),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: _addFunds,
                      child: const Text('Deposit',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: _withdrawFunds,
                      child: const Text('Withdraw',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Transaction History',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Expanded(
                child: ListView(
                  children: transactionHistory.map((transaction) {
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        leading: Icon(
                          transaction['type'] == 'Deposit'
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: transaction['type'] == 'Deposit'
                              ? Colors.green
                              : Colors.red,
                        ),
                        title: Text(transaction['type'] as String,
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text(transaction['date'] as String,
                            style: const TextStyle(color: Colors.grey)),
                        trailing: Text(
                          '₹${transaction['amount'].toString()}',
                          style: TextStyle(
                            color: transaction['type'] == 'Deposit'
                                ? Colors.green
                                : Colors.red,
                          ),
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
                    MaterialPageRoute(builder: (context) => const WalletPage()),
                  );
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
                if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UnderDevelopmentPage()),
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
                      color:
                          Colors.white.withOpacity(0.5), // Adjust opacity here
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
