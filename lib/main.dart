import 'package:flutter/material.dart';

import 'package:flutter_application_1/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: home_screen(),
    );
  }
}
