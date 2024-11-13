//  Identidad atomica: la unidad mas pequeña de un sistema
enum FromWho{me, hers}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;  // Campo que almacena la fecha y hora del mensaje

  Message({required this.text, this.imageUrl, required this.fromWho, required this.timestamp});
}

