import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';
import 'package:flutter_application_1/Screens/chat_bot.dart';
import 'package:flutter_application_1/Widgets/custom_button.dart';

class ChatBotEntrance extends StatefulWidget {
  const ChatBotEntrance({super.key});

  @override
  State<ChatBotEntrance> createState() => _ChatBotEntranceState();
}

class _ChatBotEntranceState extends State<ChatBotEntrance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 150,
          ),
          const Text(
            "Your AI Assistant",
            style: TextStyle(
                color: Color.fromARGB(255, 51, 125, 236),
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "You can ask your \nquestions and receive articles using artificial \nintelligence assistant",
            style: TextStyle(
                color: Color.fromARGB(255, 126, 126, 126),
                fontSize: 15,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Image.asset(
                "assets/images/ChatBot-PNG-Pic.png",
                height: 300,
                width: 300,
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatBox(),
                  ));
            },
            child: Custom_button(
                Bgcolor: Color.fromARGB(255, 51, 125, 236), title: "Continue"),
          )
        ]),
      ),
    );
  }
}
