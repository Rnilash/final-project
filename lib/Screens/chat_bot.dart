import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Colors.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<Message> messages = [];
  final TextEditingController _textController = TextEditingController();

  void sendMessage() {
    String text = _textController.text.trim();
    if (text.isEmpty) return;

    // Logic to send the message to the chatbot and receive a response
    // For now, let's simulate a response
    String botResponse = "You said: $text";

    setState(() {
      messages.add(Message(text: text, isUser: true));
      messages.add(Message(text: botResponse, isUser: false));
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
        backgroundColor: maincolor,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Your AI Assistant",
            style: TextStyle(
                color: maincolor, fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "You can ask your \nquestions and receive articles using artificial \nintelligence assistant",
            style: TextStyle(
                color: Color.fromARGB(255, 126, 126, 126), fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: (_) => sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Type your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, this.isUser = false});
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: message.isUser
              ? maincolor
              : const Color.fromARGB(255, 206, 204, 204),
          // borderRadius: BorderRadius.circular(12),
          //  color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(message.text),
      ),
    );
  }
}