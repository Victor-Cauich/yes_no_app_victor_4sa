import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_victor_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_victor_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_victor_4sa/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 6).theme(), //widget de asercion para marcar error
        home: const ChatScreen()
        ),
    );
  }
}