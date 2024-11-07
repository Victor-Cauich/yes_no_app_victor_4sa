import 'package:flutter/material.dart';
import 'package:yes_no_app_victor_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: 'Hola Ader', fromWho: FromWho.me),
    Message(text: 'Lloras porque reprobaste topicos?', fromWho: FromWho.me)
  ];
  // Controlador para manejar la posicion del scroll
  final ScrollController chatScrollController = ScrollController();

  // Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();


  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // verifica si el mensaje esta vacio
    if (text.trim().isEmpty)return;
    //El mensaje siempre va a ser "me" porque yo lo envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la Lista "messageist"
    messageList.add(newMessage);
    if (text.endsWith("?")){
      herReply();
    }
    // Imprime en la consola la cantidad de mensajes en la lista
    print('Cantidad de mensajes en la lista: ${messageList.length}');
    // Notifica si algo del provider cambio para que se guarde en el estado
    notifyListeners();
    // mueve el scroll
    moveScrollToBottom();
  }
  
    //Mover el scroll al ultimo mensaje

    Future<void> moveScrollToBottom() async{
      if (chatScrollController.hasClients) {
      // se vera aun cuando se envien mensajes cortos y rapidos
      // Un pequeño atraso en la animacion para garantizar que siempre 
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
      // maxScrollExtent determina a lo maximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
      // Duracion de la animacion
        duration: const Duration(milliseconds: 300),
      // "Rebote" al final de la animacion
         curve: Curves.easeOut);
      }
  }
  
  Future<void> herReply() async{
    // Obtener el mensaje de la peticion 
    final herMessage = await getYesNoAnswer.getAnswer();
    // Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    // Notifica si algo de provider cambio para el estado 
    notifyListeners();
    // Mueve esl scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
  }
}