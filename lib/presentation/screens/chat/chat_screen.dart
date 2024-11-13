import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';
// import 'package:yes_no_app_victor_4sa/main.dart';
import 'package:yes_no_app_victor_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/chat/her_messages._bubble.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/chat/my_messages_bubble.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9JAKy_T0XT8vx6p4sIjzmaGqHrdIK9GVR0Q&s"),
          ),
        ),


        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mi amor"),
            Text("En linea",
              style: TextStyle(fontSize: 12, color: Colors.black),
            )
          ]
        )

      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index){
                  // Instancia de message que sabra de quien es el mensaje
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message,)
                      : MyMessageBubble(message: message,);
                      
              })),
              
            // Caja de texto de mensajes
            MessageFieldBox(
              // Una vez que tenga el valor cambiado, envialo
              onValue: chatProvider.sendMessage,
              ),
          ],
        ),
      ),
    );
  }
}