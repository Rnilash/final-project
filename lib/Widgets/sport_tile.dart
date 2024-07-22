import 'package:flutter/material.dart';

class sport_tile extends StatelessWidget {
  final dynamic image;
  final String title;
  final Color bgcolor;
  final double width;
  const sport_tile(
      {super.key,
      required this.image,
      required this.title,
      required this.bgcolor,
      required this.width});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgcolor,
      ),
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 25,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
