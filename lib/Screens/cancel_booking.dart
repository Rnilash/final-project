import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/Calendar_screen.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 227, 226, 226)),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 400,

              // color: Colors.amber,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Customer's Name  -",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Kavindu Perera ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Order  -",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Royal - MAS Arena ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Starts  -",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "15th May, 2:30pm ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Ends  -",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "15th May, 5:30pm ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Number of Players  -",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "5 ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Description  -",
                      style: TextStyle(
                          color: Color.fromARGB(255, 33, 32, 32),
                          fontFamily: "Poppins"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: 400,
                      child: TextField(
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter a Description",
                          hintStyle:
                              TextStyle(fontSize: 14, fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Custom_button(Bgcolor: const Color(0xffFF4444), title: "Cancel")
          ],
        ),
      ),
    );
  }
}
