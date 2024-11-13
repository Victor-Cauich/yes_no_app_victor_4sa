import 'package:flutter/material.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatelessWidget{
  final Message message;
  const MyMessageBubble({super.key, required this.message});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    // Formatea la hora utilizando el timestamp del mensaje
    final timeSent = DateFormat('hh:mm a').format(message.timestamp); 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end ,
      children: [
        Container(
           decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
           ),
           child: Padding(
             padding: const EdgeInsets.all(5),
             child: Text(
              message.text,
              style: const TextStyle( color: Colors.white),
             ),
           ),
        ),

        const SizedBox(height: 5),

        // Mostrar la hora debajo del mensaje
        Text(
          timeSent,
          style: TextStyle(color: colors.onBackground.withOpacity(0.6), fontSize: 12),
        ),
        
        const SizedBox(height: 10),
      ],
    );
  }
}
