// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Const/Colors.dart';

// class ChatBotScreen extends StatefulWidget {
//   @override
//   _ChatBotScreenState createState() => _ChatBotScreenState();
// }

// class _ChatBotScreenState extends State<ChatBotScreen> {
//   List<Message> messages = [];
//   final TextEditingController _textController = TextEditingController();

//   void sendMessage() {
//     String text = _textController.text.trim();
//     if (text.isEmpty) return;

//     // Logic to send the message to the chatbot and receive a response
//     // For now, let's simulate a response
//     String botResponse = "You said: $text";

//     setState(() {
//       messages.add(Message(text: text, isUser: true));
//       messages.add(Message(text: botResponse, isUser: false));
//       _textController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chatbot'),
//         backgroundColor: maincolor,
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             height: 620,
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return MessageBubble(message: messages[index]);
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textController,
//                     onSubmitted: (_) => sendMessage(),
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final bool isUser;

//   Message({required this.text, this.isUser = false});
// }

// class MessageBubble extends StatelessWidget {
//   final Message message;

//   const MessageBubble({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: message.isUser
//               ? maincolor
//               : const Color.fromARGB(255, 206, 204, 204),
//           // borderRadius: BorderRadius.circular(12),
//           //  color: Colors.yellow,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               offset: const Offset(2, 2),
//               blurRadius: 4,
//             ),
//           ],
//         ),
//         child: Text(message.text),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'User 1', 'message': 'Hello!'},
    {'sender': 'User 2', 'message': 'Hi there!'},
  ];

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'User 1', 'message': _textController.text});
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isCurrentUser = message['sender'] == 'User 1';
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(message['sender'][0].toUpperCase()),
                  ),
                  title: Text(message['message']),
                  trailing: isCurrentUser ? const Icon(Icons.check) : null,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
