import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/main_dashboard.dart';

class PaymentScreen extends StatefulWidget {
  final double amount; // Replace with actual data structure
  final String cardLabel;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  final bool saveCard;
  final bool usePayPal;
  final int hours;
  final int price_per_hour;

  PaymentScreen({
    required this.amount,
    required this.cardLabel,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    required this.saveCard,
    required this.usePayPal,
    required this.hours,
    required this.price_per_hour,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text(
          'Confirm Bookings',
          style: const TextStyle(fontFamily: "Poppins", color: Colors.black),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rs. ${widget.hours * widget.price_per_hour}.00',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle view detailed order
                        },
                        child: const Text('View detailed order'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Credit/Debit Card section
              /*
              RadioListTile(
                title: const Text('Credit/Debit Card'),
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
                      decoration:
                          const InputDecoration(labelText: 'Card Label'),
                      controller: TextEditingController(text: widget.cardLabel),
                      onChanged: (value) {
                        // Update card label
                      },
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: 'Name on Card'),
                      controller: TextEditingController(text: widget.cardName),
                      onChanged: (value) {
                        // Update card name
                      },
                    ),
                    // ... other card details fields
                  ],
                ),
              const SizedBox(height: 16),
              // PayPal section
              RadioListTile(
                title: const Text('PayPal'),
                value: false,
                groupValue: !widget.usePayPal,
                onChanged: (value) {
                  // Handle payment method change
                },
              ),
               */
              Row(
                children: [
                  const Text(
                    "Credit / Debit Card",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Image.asset(
                    "assets/images/visa master.png",
                    height: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 233, 231, 231),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Pay securely with your Bank Account using Visa or Mastercard",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Card Label'),
                controller: TextEditingController(text: widget.cardLabel),
                onChanged: (value) {
                  // Update card label
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Name on Card'),
                controller: TextEditingController(text: widget.cardName),
                onChanged: (value) {
                  // Update card name
                },
              ),
              // Row(
              //   children: [
              //     TextField(
              //       decoration: const InputDecoration(labelText: 'Card Label'),
              //       controller: TextEditingController(text: widget.cardLabel),
              //       onChanged: (value) {
              //         // Update card label
              //       },
              //     ),
              //     TextField(
              //       decoration:
              //           const InputDecoration(labelText: 'Name on Card'),
              //       controller: TextEditingController(text: widget.cardName),
              //       onChanged: (value) {
              //         // Update card name
              //       },
              //     )
              //   ],
              // ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle payment
                },
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
