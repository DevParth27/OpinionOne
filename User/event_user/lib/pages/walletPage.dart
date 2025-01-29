import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double availableBalance = 0.0;
  List<Map<String, dynamic>> transactionHistory = [];
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
      availableBalance = prefs.getDouble(_balanceKey) ?? 1000;
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

  List<Map<String, dynamic>> _parseTransactionHistory(
      List<String>? transactions) {
    if (transactions == null) return [];
    return transactions.map((transaction) {
      final parts = transaction.split('|');
      return {
        'type': parts[0],
        'amount': double.parse(parts[1]),
        'date': parts[2]
      };
    }).toList();
  }

  List<String> _encodeTransactionHistory(
      List<Map<String, dynamic>> transactions) {
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
    return Scaffold(
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
