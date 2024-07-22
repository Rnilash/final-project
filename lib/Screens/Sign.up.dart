import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/Log_in_page.dart';
import 'package:flutter_application_1/Services/Auth.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

class Sign_up_page extends StatefulWidget {
  Sign_up_page({
    super.key,
  });

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  // final AuthServices auth = AuthServices();
  final formkey = GlobalKey<FormState>();
  String email = "";
  String username = "";
  String password = "";
  String confirmpassword = "";
  String error = "";

  get result => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                _header(context),
                const SizedBox(
                  height: 80,
                ),
                _inputField(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sign Up",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins")),
        const SizedBox(
          height: 18,
        ),
        const Text("If you already have an account ",
            style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins")),
        Row(
          children: [
            const Text("You can ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login_page(),
                    ));
              },
              child: const Text("  Sign in here !",
                  style: TextStyle(
                      color: spcolor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins")),
            ),
          ],
        )
      ],
    );
  }

  _inputField(context) {
    return Form(
      key: formkey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Email",
          style: TextStyle(
              color: Color.fromARGB(255, 99, 98, 98), fontFamily: "Poppins"),
        ),
        TextFormField(
          validator: (value) =>
              value?.isEmpty == true ? "Enter a Valid email" : null,
          onChanged: (value) => setState(() {
            email = value;
          }),
          decoration: const InputDecoration(
            hintText: "Enter your email address",
            hintStyle: TextStyle(fontFamily: "Poppins"),
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 35),
        const Text(
          "Username",
          style: TextStyle(
              color: Color.fromARGB(255, 99, 98, 98), fontFamily: "Poppins"),
        ),
        TextFormField(
          validator: (value) =>
              value?.isEmpty == true ? "Enter a Valid User name" : null,
          onChanged: (value) => setState(() {
            username = value;
          }),
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Enter your Username",
            hintStyle: TextStyle(fontFamily: "Poppins"),
            prefixIcon: Icon(
              Icons.person,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const Text(
          "Password",
          style: TextStyle(
              color: Color.fromARGB(255, 99, 98, 98), fontFamily: "Poppins"),
        ),
        TextFormField(
          validator: (value) =>
              value!.length < 6 ? "Enter a Valid password" : null,
          onChanged: (value) => setState(() {
            password = value;
          }),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Enter your Password",
            hintStyle: TextStyle(fontFamily: "Poppins"),
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 35),
        const Text(
          "Confirm Password",
          style: TextStyle(
              color: Color.fromARGB(255, 99, 98, 98), fontFamily: "Poppins"),
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) return 'Empty';
            if (value != password) return 'Not Match';
            return null;
          },

          // (value) => value == password || value?.isEmpty == true
          //     ? "Password is not same"
          //     : null,
          onChanged: (value) => setState(() {
            confirmpassword = value;
          }),
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Confirm your Password",
            hintStyle: TextStyle(fontFamily: "Poppins"),
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Text(error),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login_page(),
                  ));
              // setState(() {
              //   error = 'Please enter a valid email!';
              // });
            },
            child: const Custom_button(Bgcolor: maincolor, title: "Signup"))
      ]),
    );
  }
}
