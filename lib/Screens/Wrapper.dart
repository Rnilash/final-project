import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user_model.dart';
import 'package:flutter_application_1/Screens/authenticate.dart';
import 'package:flutter_application_1/Screens/home_screen.dart';
import 'package:flutter_application_1/Screens/main_dashboard.dart';
import 'package:flutter_application_1/test.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null) {
      return home_screen();
    } else {
      return const main_dash();
    }
  }
}
