import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/Calendar_screen.dart';

class cancel_booking extends StatefulWidget {
  const cancel_booking({super.key});

  @override
  State<cancel_booking> createState() => _cancel_bookingState();
}

class _cancel_bookingState extends State<cancel_booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Row(
          children: [
            Icon(
              Icons.calendar_month_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Cancel Bookings',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => calendar_screen()));
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: Image.asset(
                'assets/images/royal mas.jpg',
                height: 200,
                width: 420,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 35,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 227, 226, 226)),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Order Details',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Customer's Name",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
