import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Data/arena_data.dart';
import 'package:flutter_application_1/Screens/arena_Booking.dart';
import 'package:flutter_application_1/Screens/arena_list.dart';
import 'package:flutter_application_1/Screens/coach_booking_page.dart';
import 'package:flutter_application_1/Screens/coach_list.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Widgets/Scrollable_card_.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

import 'package:flutter_application_1/Widgets/review_card.dart';

class Coach_DetailPage extends StatefulWidget {
  final ScrollableCard card;

  const Coach_DetailPage({Key? key, required this.card}) : super(key: key);

  @override
  State<Coach_DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<Coach_DetailPage> {
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
                  builder: (context) => const coach_list(),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget
                          .card.image, // Replace with your image path if needed
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: widget.card.status == "Available" ||
                                      widget.card.status == "Free"
                                  ? const Color(
                                      0xff69E156) // Green for Available or Free
                                  : Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.card.status,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              color: widget.card.status == "Available" ||
                                      widget.card.status == "Free"
                                  ? const Color(
                                      0xff69E156) // Green for Available or Free
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Qualified " + widget.card.category,
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rs. ${widget.card.price.toStringAsFixed(2)} per hour',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Display card details here, e.g., larger image, description

              Container(
                height: 100,
                width: 250,
                decoration: const BoxDecoration(
                  color: Color(0xffF9F7F7),
                  // borderRadius: BorderRadius.circular(50)
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone_in_talk_rounded,
                        color: Colors.black,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "0" + widget.card.tp1.toStringAsFixed(0),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("0" + widget.card.tp2.toStringAsFixed(0),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color(0xffF9F7F7),
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.timer_sharp,
                        color: Colors.black,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mon : " + widget.card.monday,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                          Text("Tue-Wed : " + widget.card.tue_wedn,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                          Text("Sun : " + widget.card.sunday,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: 250,
                decoration: const BoxDecoration(
                  color: Color(0xffF9F7F7),
                  // borderRadius: BorderRadius.circular(50)
                ),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.card.location,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => coach_booking(
                            card: widget.card,
                            price_per_hour: widget.card.price.toInt(),
                          ),
                        ));
                  },
                  child: const Custom_button(
                      Bgcolor: maincolor, title: "BOOK NOW")),
              const SizedBox(
                height: 20,
              ),

              review_card(
                  image: widget.card.reviewer_img,
                  name: widget.card.reviewer_name,
                  review: widget.card.review),

              review_card(
                  image: widget.card.reviewer2_img,
                  name: widget.card.reviewer2_name,
                  review: widget.card.review2)
            ],
          ),
        ),
      ),
    );
  }
}

// class arena_booking extends StatefulWidget {
//   // final ScrollableCard card;
//   const arena_booking({
//     super.key,
//     // required this.card,
//   });

//   @override
//   State<arena_booking> createState() => _arena_bookingState();
// }

// class _arena_bookingState extends State<arena_booking> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AppBar(
//         backgroundColor: maincolor,
//         title: const Text(
//           // widget.card.title,
//           "sdada",
//           style: TextStyle(color: Colors.black),
//         ),
//         // actions: [
//         //   Row(
//         //     mainAxisAlignment: MainAxisAlignment.end,
//         //     children: [
//         //       IconButton(
//         //         icon: const Icon(
//         //           Icons.calendar_month,
//         //           color: Colors.black,
//         //         ),
//         //         onPressed: () {
//         //           // Handle search logic
//         //         },
//         //       ),
//         //       IconButton(
//         //         icon: const Icon(
//         //           Icons.person,
//         //           color: Colors.black,
//         //         ),
//         //         onPressed: () {
//         //           // Handle search logic
//         //         },
//         //       ),
//         //     ],
//         //   ),
//         // ],
//         // leading: IconButton(
//         //   icon: Icon(
//         //     Icons.arrow_back_ios_new_rounded,
//         //     color: Colors.black,
//         //   ),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//       ),
//     );
//   }
// }