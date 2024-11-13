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
            borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
             padding: const EdgeInsets.all(5),
             child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Texto de la burbuja
                Flexible(
                  child: Text(
                    message.text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 5),

                // Icono de las dos palomitas dentro de la burbuja
                const Icon(
                  Icons.done_all,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),

        // Mostrar la hora debajo de la burbuja
        Text(
          timeSent,
          style: TextStyle(color: colors.onBackground.withOpacity(0.6), fontSize: 12),
        ),
        
        const SizedBox(height: 10),
      ],
    );
  }
}
