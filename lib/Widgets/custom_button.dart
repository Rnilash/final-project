import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_button extends StatelessWidget {
  final Color Bgcolor;
  final String title;
  const Custom_button({super.key, required this.Bgcolor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color.fromARGB(62, 0, 0, 0),
            spreadRadius: 0.1,
            blurRadius: 5)
      ], color: Bgcolor, borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
