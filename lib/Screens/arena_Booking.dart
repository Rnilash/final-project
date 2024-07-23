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
  get card => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          widget.card.title,
          style: TextStyle(color: Colors.black),
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
          icon: Icon(
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
    );
  }
}
