import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Models/user_model.dart';
import 'package:flutter_application_1/Screens/Sign.up.dart';
import 'package:flutter_application_1/Screens/Log_in_page.dart';
import 'package:flutter_application_1/Screens/Wrapper.dart';

import 'package:flutter_application_1/Screens/main_dashboard.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';
import 'package:flutter_application_1/test.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({
    super.key,
  });

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff6FBEF7),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 170,
                ),
                Image.asset(
                  "assets/images/pngwing.com (23).png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 250,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login_page(),
                          ));
                    },
                    child: const Custom_button(
                        Bgcolor: maincolor, title: "Login")),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sign_up_page(),
                          ));
                    },
                    child: const Custom_button(
                        Bgcolor: maincolor, title: "Signup"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
