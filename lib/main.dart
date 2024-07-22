import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user_model.dart';
import 'package:flutter_application_1/Screens/Log_in_page.dart';
import 'package:flutter_application_1/Screens/Wrapper.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Services/Auth.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:provider/provider.dart';

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
