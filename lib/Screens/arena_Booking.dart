import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/arena_detail_page.dart';
import 'package:flutter_application_1/Widgets/result_card.dart';

class arena_booking extends StatefulWidget {
  final ScrollableCard card;
  const arena_booking({
    super.key,
    required this.card,
  });

  @override
  State<arena_booking> createState() => _arena_bookingState();
}

class _arena_bookingState extends State<arena_booking> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  String starts = "";
  String ends = "";
  String num_of_players = "";
  String description = "";

  get card => null;

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
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.card.image, // Replace with your image path if needed
                  height: 200,
                  width: 420,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Form(
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
                    height: 50,
                    child: TextFormField(
                      validator: (value) =>
                          value?.isEmpty == true ? "Enter a Valid Name" : null,
                      onChanged: (value) => setState(() {
                        name = value;
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your Name",
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Customer's Name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 33, 32, 32),
                                fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 50,
                            width: 60,
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
                        ],
                      ),
                    ],
                  )
                ],
              )),
              ElevatedButton(
                onPressed: () {
                  // Handle booking logic
                },
                child: const Text('BOOK NOW'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
