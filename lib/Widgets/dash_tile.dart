import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';

class dash_tile extends StatelessWidget {
  final String title;
  final String image;
  const dash_tile({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xff6FB6F7),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(62, 0, 0, 0),
                spreadRadius: 0.1,
                blurRadius: 5)
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset(
            image,
            width: 80,
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
