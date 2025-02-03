import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckPayment extends StatefulWidget {
  const CheckPayment({super.key});

  @override
  _CheckPaymentState createState() => _CheckPaymentState();
}

class _CheckPaymentState extends State<CheckPayment> {
  late Razorpay _razorpay;
  String userEmail = FirebaseAuth.instance.currentUser?.email ?? 'unknown';

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    // Event Listeners
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openRazorpay() {
    var options = {
      'key': 'rzp_live_pcmYlabTUmbRnV',
      'amount': 100 * 100, // Amount in paise (10000 paise = 100 INR)
      'name': 'Bartr',
      'description': 'Payment for Order!',
      'prefill': {
        'contact': 'The User number',
        'email': 'user@bartr.in',
      },
      'theme': {'color': '#3399cc'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> _updatePaymentStatus(String userEmail, String paymentId) async {
    final CollectionReference payments =
        FirebaseFirestore.instance.collection('payments');

    await payments.add({
      'userEmail': userEmail,
      'paymentDone': 'yes',
      'paymentId': paymentId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    debugPrint('Payment Successful: ${response.paymentId}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );

    // Assuming you have the user's email stored somewhere (e.g., after login)
    String userEmail = FirebaseAuth.instance.currentUser?.email ?? 'unknown';

    // Update Firestore with payment details
    await _updatePaymentStatus(userEmail, response.paymentId!);

    // Navigate to the homepage
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Failed: ${response.code} | ${response.message}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.message}")),
    );

    // Stay on the payment page
    // No navigation logic here
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet Selected: ${response.walletName}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("External Wallet Selected: ${response.walletName}")),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Payment'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: openRazorpay,
          child: const Text('Pay with Razorpay'),
        ),
      ),
    );
  }
}
