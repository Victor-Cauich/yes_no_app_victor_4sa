import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
          ),
        ),
        title: const Text("Mi amor "),
      ),
    );
  }
}