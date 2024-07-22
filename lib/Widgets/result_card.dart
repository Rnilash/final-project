import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/arena_data.dart';

class ScrollableCard extends StatelessWidget {
  final String title;
  final String location;
  final String status;
  final String category;
  final String image;
  final double price;
  final double tp1;
  final double tp2;
  final String monday;
  final String tue_wedn;
  final String sunday;
  final String reviewer_img;
  final String reviewer_name;
  final String review;
  final String reviewer2_img;
  final String reviewer2_name;
  final String review2;

  final String loc_img;

  const ScrollableCard({
    Key? key,
    required this.title,
    required this.location,
    required this.status,
    required this.category,
    required this.image,
    required this.price,
    required this.tp1,
    required this.tp2,
    required this.monday,
    required this.tue_wedn,
    required this.sunday,
    required this.reviewer_img,
    required this.reviewer_name,
    required this.review,
    required this.reviewer2_img,
    required this.reviewer2_name,
    required this.review2,
    required this.loc_img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Set your desired radius
      ),
      elevation: 6,
      color: Color.fromARGB(213, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 30,
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.groups_2),
                SizedBox(
                  width: 20,
                ),
                Text(
                  category,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: status == "Available"
                                ? Color(0xff69E156)
                                : Colors.red),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        status,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: status == "Available"
                                ? Color(0xff69E156)
                                : Colors.red),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
