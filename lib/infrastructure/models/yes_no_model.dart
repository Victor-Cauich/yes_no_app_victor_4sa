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
    final String answer; // Respuesta de sí o no como texto
    final bool forced;
    final String image; // GIF de la respuesta
     final DateTime timestamp; // Marca temporal que representa la fecha y hora de la respuesta

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
        required this.timestamp,
    });
    // Crea una instancia de YesNoModel desde un mapa JSON
    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"], // Asigna el valor de "answer" del JSON al campo answer
        forced: json["forced"], // Asigna el valor de "forced" del JSON al campo forced
        image: json["image"], // Asigna el valor de "image" del JSON al campo image
        timestamp: DateTime.now(), // Usamos la fecha y hora actuales para el timestamp
    );

    Message toMessageEntity() => Message (
      // Condicional para darle valor a los mensajes
      text: answer == 'yes'
      ? 'sí' 
      : answer == "no"
      ? "No"
      : "Quizas", 
      fromWho: FromWho.hers, // Identifica que la respuesta es "de ella"
      // sera el gif
      imageUrl: image,
      timestamp: timestamp, // Pasamos el timestamp a la entidad Message
      );
}
 
