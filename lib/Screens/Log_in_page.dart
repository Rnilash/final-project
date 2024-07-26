import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/Sign.up.dart';
import 'package:flutter_application_1/Screens/main_dashboard.dart';
import 'package:flutter_application_1/Services/Auth.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

class Login_page extends StatefulWidget {
  Login_page({
    super.key,
  });

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  // final AuthServices auth = AuthServices();

  bool value = true;
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
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
        const Text("Sign In",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins")),
        const SizedBox(
          height: 18,
        ),
        const Text("If you don’t have an account ",
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
                      builder: (context) => Sign_up_page(),
                    ));
              },
              child: const Text("  Register here !",
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
        const SizedBox(height: 30),
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
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Enter your Password",
            hintStyle: TextStyle(fontFamily: "Poppins"),
            prefixIcon: Icon(
              Icons.lock,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                const Text(
                  'Remember me ',
                  style: TextStyle(fontSize: 15.0, fontFamily: "Poppins"),
                ), //Text
                const SizedBox(width: 10),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot password?",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Poppins",
                      color: Color.fromARGB(255, 86, 85, 85))),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          error,
          style: const TextStyle(color: Colors.red),
        ),
        GestureDetector(
            onTap: () {
              if (formkey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const main_dash(),
                    ));
              }
            },
            child: const Custom_button(Bgcolor: maincolor, title: "Login")),
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Text(
            "or continue with",
            style: TextStyle(
                color: Color.fromARGB(255, 99, 98, 98),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icons8-facebook-48.png",
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/icons8-google-48.png",
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/icons8-apple-50.png",
              width: 30,
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}






// ElevatedButton(
          //     onPressed: () async {
          //       dynamic result = await auth.SignInAnony();
          //       if (result == null) {
          //         print("error in sign in anony");
          //       } else {
          //         print(result.uid);
          //       }
          //     },
          //     child: Text("Sign In Anony")),