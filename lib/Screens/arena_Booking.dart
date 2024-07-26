import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/arena_detail_page.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Screens/payment_page.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';
import 'package:flutter_application_1/Widgets/result_card.dart';

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class arena_booking extends StatefulWidget {
  final int price_per_hour;
  final ScrollableCard card;
  const arena_booking({
    super.key,
    required this.card,
    required this.price_per_hour,
  });

  @override
  State<arena_booking> createState() => _arena_bookingState();
}

class _arena_bookingState extends State<arena_booking> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  String startsstring = "";
  String endsstring = "";
  String num_of_players = "";
  String description = "";
  DateTime starts = DateTime.now();
  DateTime ends = DateTime.now();

  get card => null;
  int totalhours = 0;

  int minutes_to_hours(double total_minutes) {
    final hours = total_minutes ~/ 60; // Integer division for full hours
    final remaining_minutes = total_minutes.remainder(60);

    // Round up if any remaining minutes exist
    return remaining_minutes > 0 ? hours + 1 : hours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          title: Text(
            widget.card.title,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Handle search logic
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Handle search logic
                  },
                ),
              ],
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      card: widget.card,
                    ),
                  ));
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget
                          .card.image, // Replace with your image path if needed
                      height: 200,
                      width: 420,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Customer's Name",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 32, 32),
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                            validator: (value) => value?.isEmpty == true
                                ? "Enter a Valid Name"
                                : null,
                            onChanged: (value) => setState(() {
                              name = value;
                            }),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your Name",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Starts",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 33, 32, 32),
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(
                                height: 70,
                                width: 180,
                                child: TextFormField(
                                  enabled: false,
                                  controller:
                                      TextEditingController(text: startsstring),
                                  validator: (value) => value?.isEmpty == true
                                      ? "Pick a Date"
                                      : null,
                                  onChanged: (value) => setState(() {
                                    name = value;
                                  }),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Pick a Date",
                                    hintStyle: TextStyle(
                                        fontSize: 14, fontFamily: "Poppins"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 25,
                                child: ElevatedButton(
                                  onPressed: () {
                                    DatePicker.showDateTimePicker(
                                      context,
                                      // showSeconds: true,
                                      onConfirm: (date) {
                                        setState(() {
                                          starts = date;
                                          startsstring =
                                              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}   ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
                                        });
                                      },
                                      currentTime: starts,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: maincolor, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Pick'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ends",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 33, 32, 32),
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(
                                height: 70,
                                width: 180,
                                child: TextFormField(
                                  enabled: false,
                                  controller:
                                      TextEditingController(text: endsstring),
                                  validator: (value) => value?.isEmpty == true
                                      ? "Enter a Valid Date"
                                      : null,
                                  onChanged: (value) => setState(() {
                                    name = value;
                                  }),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Pick a Date",
                                    hintStyle: TextStyle(
                                        fontSize: 14, fontFamily: "Poppins"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 25,
                                child: ElevatedButton(
                                  onPressed: () {
                                    DatePicker.showDateTimePicker(
                                      context,
                                      // showSeconds: true,
                                      onConfirm: (date) {
                                        setState(() {
                                          ends = date;
                                          endsstring =
                                              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}   ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
                                          final duration =
                                              ends.difference(starts);
                                          final total_minutes =
                                              duration.inMinutes.toDouble();
                                          final hours =
                                              minutes_to_hours(total_minutes);

                                          // Print or display the calculated hours
                                          print(
                                              'Hours between starts and ends (rounded up): $hours');
                                          totalhours = hours;
                                        });
                                      },
                                      currentTime: ends,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: maincolor, // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  child: const Text('Pick'),
                                ),
                              ),
                            ],
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Number of players",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 32, 32),
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 70,
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) => value?.isEmpty == true
                                ? "Enter a Valid Number"
                                : null,
                            onChanged: (value) => setState(() {
                              num_of_players = value;
                            }),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter the number of players",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 32, 32),
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 100,
                          width: 400,
                          child: TextFormField(
                            maxLines: 5,
                            keyboardType: TextInputType.text,
                            onChanged: (value) => setState(() {
                              description = value;
                            }),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter a Description",
                              hintStyle: TextStyle(
                                  fontSize: 14, fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  // if (formkey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentScreen(
                                          hours: totalhours,
                                          price_per_hour: widget.price_per_hour,
                                        ),
                                      ));
                                  // } else {}
                                },
                                child: const Custom_button(
                                    Bgcolor: maincolor, title: "BOOK NOW")),
                          ],
                        )
                      ],
                    ),
                  ),
                ]))));
  }
}
