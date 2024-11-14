import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  // Función que emite el valor del mensaje cuando cambia
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // Controlador para el campo de texto
    final textController = TextEditingController();
    // Nodo de enfoque para manejar el foco en el campo de texto
    final focusNode = FocusNode();

    // Configuración de borde para el campo de texto
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent), // Borde transparente
      borderRadius: BorderRadius.circular(40), // Bordes redondeados
    );

    // Decoración del campo de texto, incluyendo un icono de envío
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"', // Texto sugerido en el campo
      enabledBorder: outlineInputBorder, // Borde al estar inactivo
      focusedBorder: outlineInputBorder, // Borde al estar activo
      filled: true, // Fondo relleno
      // Icono de envío a la derecha del campo de texto
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined), // Icono de envío
        onPressed: () {
          final textValue = textController.value.text; // Obtiene el texto escrito
          onValue(textValue); // Llama a la función de emisión con el texto
          textController.clear(); // Limpia el campo de texto
        },
      ),
    );

    return TextFormField(
      // Desenfoca el campo cuando se hace click fuera de él
      onTapOutside: (event) {
        focusNode.unfocus(); // Pierde el enfoque
      },
      focusNode: focusNode, // Asigna el nodo de enfoque
      controller: textController, // Controlador del texto
      decoration: inputDecoration, // Decoración del campo de texto
      // Envía el valor y limpia el campo cuando se presiona Enter
      onFieldSubmitted: (value) {
        textController.clear(); // Limpia el texto
        focusNode.requestFocus(); // Devuelve el enfoque al campo
        onValue(value); // Llama a la función de emisión con el valor
      },
    );
  }
}
