import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';
//import 'package:yes_no_app_victor_4sa/main.dart';
import 'package:yes_no_app_victor_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/chat/her_messages._bubble.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/chat/my_messages_bubble.dart';
import 'package:yes_no_app_victor_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  // Método que construye la interfaz de la pantalla del chat
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar que muestra la información del contacto en la parte superior
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            // Imagen de perfil del contacto
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9JAKy_T0XT8vx6p4sIjzmaGqHrdIK9GVR0Q&s"),
          ),
        ),
        // Título del AppBar con el nombre del contacto y el estado
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mi amor"), // Nombre del contacto
            Text(
              "En linea", // Estado del contacto
              style: TextStyle(fontSize: 12, color: Colors.black),
            )
          ]
        )
      ),
      // Cuerpo de la pantalla que contiene el chat
      body: _ChatView(),
    );
  }
}

// Widget que representa la vista de chat y la lista de mensajes
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); // Obtiene el chat provider para acceder a los mensajes y funcionalidades
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController, // Controlador para manejar el desplazamiento de la lista de chat
                itemCount: chatProvider.messageList.length, // Número de mensajes en la lista
                itemBuilder: (context, index) {
                  // Obtiene el mensaje actual en la lista
                  final message = chatProvider.messageList[index];
                  // Determina el tipo de burbuja de mensaje en función del remitente
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message) // Burbuja de ella
                      : MyMessageBubble(message: message); // Mi burbuja de texto
              }),
            ),
            // Caja de texto 
            MessageFieldBox(
              onValue: chatProvider.sendMessage, // Envía el mensaje una vez se ha ingresado
            ),
          ],
        ),
      ),
    );
  }
}
