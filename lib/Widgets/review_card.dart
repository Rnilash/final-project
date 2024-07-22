import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/arena_data.dart';

class review_card extends StatelessWidget {
  final String image;
  final String name;
  final String review;
  const review_card(
      {super.key,
      required this.image,
      required this.name,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust as needed
          side: BorderSide(
            color: Color.fromARGB(255, 208, 207, 207), // Customize color
            width: 4.0, // Customize width
          ),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                review,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 96, 96, 96)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
