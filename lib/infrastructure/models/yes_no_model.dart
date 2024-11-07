// El modelo define que datos debe tener la aplicación 
// Investigar MVC. Modelo Vista Controlador
// Modelo: datos,     Vista: Pantalla,    Controlador: logica
// Patron de dieño de software

class YesNoModel {
  // Atributos de la clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}

