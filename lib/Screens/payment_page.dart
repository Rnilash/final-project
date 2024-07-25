import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double amount; // Replace with actual data structure
  final String cardLabel;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  final bool saveCard;
  final bool usePayPal;

  PaymentScreen({
    required this.amount,
    required this.cardLabel,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    required this.saveCard,
    required this.usePayPal,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Bookings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // Add any additional actions here
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rs. ${widget.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle view detailed order
              },
              child: Text('View detailed order'),
            ),
            SizedBox(height: 16),
            // Credit/Debit Card section
            RadioListTile(
              title: Text('Credit/Debit Card'),
              value: true,
              groupValue: !widget.usePayPal,
              onChanged: (value) {
                // Handle payment method change
              },
            ),
            if (!widget.usePayPal)
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Card Label'),
                    controller: TextEditingController(text: widget.cardLabel),
                    onChanged: (value) {
                      // Update card label
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Name on Card'),
                    controller: TextEditingController(text: widget.cardName),
                    onChanged: (value) {
                      // Update card name
                    },
                  ),
                  // ... other card details fields
                ],
              ),
            SizedBox(height: 16),
            // PayPal section
            RadioListTile(
              title: Text('PayPal'),
              value: false,
              groupValue: !widget.usePayPal,
              onChanged: (value) {
                // Handle payment method change
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle payment
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
