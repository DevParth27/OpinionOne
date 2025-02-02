// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
// import 'package:flutter/services.dart'; // For rootBundle
// import 'dart:convert'; // For jsonDecode

// class CheckPayment extends StatefulWidget {
//   const CheckPayment({super.key});

//   @override
//   _CheckPaymentState createState() => _CheckPaymentState();
// }

// class _CheckPaymentState extends State<CheckPayment> {
//   final List<PaymentItem> _paymentItems = [
//     const PaymentItem(
//       label: 'Total',
//       amount: '1.00',
//       status: PaymentItemStatus.final_price,
//     ),
//   ];

//   void _onGooglePayResult(paymentResult) {
//     debugPrint('Payment Success: $paymentResult');
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Payment Successful!")),
//     );
//   }

//   // Function to load payment configuration from assets
//   Future<PaymentConfiguration> _loadPaymentConfiguration() async {
//     // Load the JSON file from assets
//     final String jsonString =
//         await rootBundle.loadString('assets/payment_profile.json');
//     // Decode the JSON string into a Map
//     final Map<String, dynamic> paymentProfile = jsonDecode(jsonString);
//     // Create and return the PaymentConfiguration object
//     return PaymentConfiguration.fromJson(paymentProfile);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Check Payment')),
//       body: FutureBuilder<PaymentConfiguration>(
//         future: _loadPaymentConfiguration(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(
//                 child: Text('Payment configuration not found.'));
//           } else {
//             final paymentConfiguration = snapshot.data!;
//             return Center(
//               child: GooglePayButton(
//                 paymentConfiguration: paymentConfiguration,
//                 paymentItems: _paymentItems,
//                 type: GooglePayButtonType.pay,
//                 onPaymentResult: _onGooglePayResult,
//                 loadingIndicator:
//                     const Center(child: CircularProgressIndicator()),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
