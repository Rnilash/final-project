import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/arena_list.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';
import 'package:flutter_application_1/Widgets/result_card.dart';
import 'package:flutter_application_1/Widgets/review_card.dart';

class DetailPage extends StatefulWidget {
  final ScrollableCard card;

  const DetailPage({Key? key, required this.card}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                  builder: (context) => arena_list(),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Display card details here, e.g., larger image, description
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.card.image, // Replace with your image path if needed
                  height: 200,
                  width: 420,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: widget.card.status == "Available"
                            ? Color(0xff69E156)
                            : Colors.red),
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
                        color: widget.card.status == "Available"
                            ? Color(0xff69E156)
                            : Colors.red),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.card.category,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Rs. ${widget.card.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
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
                      Icon(
                        Icons.phone_in_talk_rounded,
                        color: Colors.black,
                        size: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "0" + widget.card.tp1.toStringAsFixed(0),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("0" + widget.card.tp2.toStringAsFixed(0),
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
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
                      Icon(
                        Icons.timer_sharp,
                        color: Colors.black,
                        size: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mon : " + widget.card.monday,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text("Tue-Wed : " + widget.card.tue_wedn,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text("Sun : " + widget.card.sunday,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Custom_button(Bgcolor: maincolor, title: "BOOK NOW"),
              SizedBox(
                height: 20,
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(widget.card.loc_img),
              ),
              SizedBox(
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
