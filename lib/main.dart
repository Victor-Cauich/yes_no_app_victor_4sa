import 'package:flutter/material.dart';
import 'package:yes_no_app_victor_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_victor_4sa/presentation/chat/chat_screen.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme( selectedColor: 6).theme(), //widget de asercion para marcar error
      home: const ChatScreen()
      );
  }
}