//  Identidad atomica: la unidad mas pequeña de un sistema

enum FromWho{me, hers} // Enum representa la identidad de quien envía el mensaje.

class Message {
  final String text; // contenido del mensaje
  final String? imageUrl; // URL para la imagen
  final FromWho fromWho; // Identifica quien envia el mensaje
  final DateTime timestamp;  // Campo que almacena la fecha y hora del mensaje

  Message({required this.text, this.imageUrl, required this.fromWho, required this.timestamp});
}

