// El modelo define que datos debe tener la aplicación 
// Investigar MVC. Modelo Vista Controlador
// Modelo: datos,     Vista: Pantalla,    Controlador: logica
// Patron de dieño de software

//Atributos de la clase

// factory no necesariamente crea una nueva instancia

// To parse this JSON data, do

// final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;
     final DateTime timestamp;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
        required this.timestamp,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
        timestamp: DateTime.now(), // Usamos la fecha y hora actuales para el timestamp
    );

    Message toMessageEntity() => Message (
      // Condicional para darle valor a los mensajes
      text: answer == 'yes'
      ? 'sí' 
      : answer == "no"
      ? "No"
      : "Quizas", 
      fromWho: FromWho.hers,
      // sera el gif
      imageUrl: image,
      timestamp: timestamp, // Pasamos el timestamp a la entidad Message
      );
}
 
