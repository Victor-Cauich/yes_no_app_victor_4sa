import 'package:flutter/material.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';
import 'package:intl/intl.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message; 
  const MyMessageBubble({super.key, required this.message});
  
  // Método build que construye la burbuja de mensaje
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Obtiene el esquema de colores del tema
    
    // Formatea la hora utilizando el timestamp del mensaje
    final timeSent = DateFormat('hh:mm a').format(message.timestamp); 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // Alinea el contenido a la derecha
      children: [
        // Burbuja de texto de mi ensaje
        Container(
           decoration: BoxDecoration(
            color: colors.primary, // Color de fondo de la burbuja
            borderRadius: BorderRadius.circular(20), // Esquinas redondeadas
           ),
           child: Padding(
             padding: const EdgeInsets.all(5),
             child: Row(
              mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del contenedor a su contenido
              children: [
                // Texto del mensaje dentro de la burbuja
                Flexible(
                  child: Text(
                    message.text, // Contenido del mensaje
                    style: const TextStyle(color: Colors.white), // Texto en blanco 
                  ),
                ),

                const SizedBox(width: 5), // Espacio entre el texto y el icono de las palomitas

                // Icono de dos palomitas dentro de la burbuja
                const Icon(
                  Icons.done_all,
                  color: Colors.blue, // Palomitas en color azul 
                  size: 16, // Tamaño para las palomitas
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5), // Espacio entre la burbuja y la hora

        // Muestra la hora en que se envió el mensaje debajo de la burbuja
        Text(
          timeSent,
          style: TextStyle(
            color: colors.onBackground.withOpacity(0.6), // Texto en color de fondo
            fontSize: 12, // Tamaño de fuente para la hora
          ),
        ),
        
        const SizedBox(height: 10), // Espacio al final del mensaje
      ],
    );
  }
}
