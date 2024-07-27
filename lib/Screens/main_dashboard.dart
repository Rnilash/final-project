import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/arena_list.dart';
import 'package:flutter_application_1/Screens/coach_list.dart';
import 'package:flutter_application_1/Services/Auth.dart';
import 'package:flutter_application_1/Widgets/dash_tile.dart';

class main_dash extends StatelessWidget {
  const main_dash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: maincolor,
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning, Kasun Perera",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Select Your...",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => arena_list(),
                              ));
                        },
                        child: dash_tile(
                            title: "Arena", image: "assets/images/arena.png")),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => coach_list(),
                              ));
                        },
                        child: dash_tile(
                            title: "Coach", image: "assets/images/Coach.png")),
                    SizedBox(
                      height: 40,
                    ),
                    dash_tile(
                        title: "Shop", image: "assets/images/shop-64.png"),
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       await AuthServices().signout();
                    //     },
                    //     child: Icon(Icons.logout))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
