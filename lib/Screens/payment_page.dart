import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/main_dashboard.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  // Replace with actual data structure

  final int hours;
  final int price_per_hour;

  const PaymentScreen({
    super.key,
    required this.hours,
    required this.price_per_hour,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  num card_label = 0;
  String name_on_card = "";
  DateTime? expire_Date;
  final TextEditingController _expirationController = TextEditingController();
  String? _expirationDate;
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _isCardValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: const Text(
            'Confirm Bookings',
            style: TextStyle(fontFamily: "Poppins", color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            // Add any additional actions here
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-9]+$')),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter card number';
                            } else if (value.length != 16) {
                              return 'Card number must be 16 digits';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                          ),
                        ),
                        TextFormField(
                          controller: _cardHolderNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter card holder name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Card Holder Name',
                          ),
                        ),
                        TextFormField(
                          readOnly: false,
                          controller: _expiryDateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            ExpirationDateFormatter()
                            // FilteringTextInputFormatter.allow(
                            //     RegExp(r'^\d{2}\/\d{2}$')),
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter expiration date';
                            }

                            try {
                              final month =
                                  int.tryParse(value.substring(0, 2)) ?? 0;
                              final year =
                                  int.tryParse('20${value.substring(2)}') ?? 0;

                              // Validate month (between 1 and 12)
                              if (month < 1 || month > 12) {
                                return 'Invalid expiration month (must be between 01 and 12)';
                              }

                              // Validate year (future date)
                              final expiryDate = DateTime(year, month, 1);
                              if (expiryDate.isBefore(DateTime.now())) {
                                return 'Expiration date is invalid';
                              }

                              return null;
                            } catch (e) {
                              return 'Invalid expiration date format';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Expire  Date ', hintText: "MM/YY"),
                        ),
                        TextFormField(
                          controller: _cvvController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter CVV';
                            } else if (value.length != 3) {
                              return 'CVV must be 3 digits';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'CVV',
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, proceed with payment
                                setState(() {
                                  _isCardValid = true;
                                });
                                // Replace this with your payment processing logic
                                print('Card details are valid');
                              } else {
                                setState(() {
                                  _isCardValid = false;
                                });
                              }
                              // Navigator.push(context, MaterialPageRoute(builder:))
                            },
                            child: Custom_button(
                                Bgcolor: maincolor, title: "Pay Now")),
                        if (_isCardValid) Text('Card is valid'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ]),
          ),
        ));
  }
}

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;

    if (newText.length > 0) {
      final newTextSplit = newText.split('');
      final newTextLength = newTextSplit.length;

      if (newText == '/') {
        return TextEditingValue(
          text: '',
          selection: TextSelection.collapsed(offset: 0),
        );
      }

      if (newTextSplit[newTextLength - 1] == '/') {
        if (newTextLength != 3) {
          return oldValue;
        }
        // Validate month here
        final month = int.tryParse(newText.substring(0, 2)) ?? 0;
        if (month < 1 || month > 12) {
          return oldValue;
        }
      } else {
        if (newTextLength > 4) {
          return oldValue;
        }
      }
    }

    return newValue;
  }
}
