import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:yes_no_app_victor_4sa/domain/entities/message.dart";

class HerMessageBubble extends StatelessWidget {
  final Message message; 
  const HerMessageBubble({super.key, required this.message});

  // Método build que construye la burbuja de mensaje de ella
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Obtiene el esquema de colores del tema
    final timeSent = DateFormat('hh:mm a').format(message.timestamp); // Formatea la hora del mensaje

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido a la izquierda
      children: [
        // Burbuja de texto del mensaje
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Color de fondo de la burbuja
            borderRadius: BorderRadius.circular(20) // Esquinas redondeadas
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, // Contenido del mensaje
              style: const TextStyle(color: Colors.white), // Texto color blanco 
            ),
          ),
        ),

        const SizedBox(height: 5), // Espacio entre la burbuja y la imagen

        // Muestra el gif
        _ImageBubble(imageUrl: message.imageUrl!),

        // Muestra la hora en que se envió el mensaje
        Text(
          timeSent,
          style: TextStyle(
            color: colors.onBackground.withOpacity(0.6), // Texto en color de fondo
            fontSize: 12, // Tamaño de la fuente 
          ),
        ),

        const SizedBox(height: 10), // Espacio al final del mensaje
      ],
    );
  }
}

// Widget para mostrar una burbuja de imagen dentro de un mensaje
class _ImageBubble extends StatelessWidget {
  final String imageUrl; // URL de la imagen que se mostrará
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtiene el tamaño de la pantalla

    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Bordes redondeados para la imagen
      child: Image.network(
        imageUrl,
        width: size.width * 0.7, // La imagen ocupa el 70% del ancho de la pantalla
        height: 150, // Altura para la imagen
        fit: BoxFit.cover, // Ajuste de la imagen para cubrir toda el área
        loadingBuilder: (context, child, loadingProgress) {
          // Muestra un mensaje temporal mientras la imagen se carga
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7, // Ancho temporal de la imagen
            height: 150, // Altura temporal de la imagen
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Mi amor está enviando una imagen"), // Mensaje de carga
          );
        },
      ),
    );
  }
}