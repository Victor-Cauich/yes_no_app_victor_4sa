import 'package:flutter/material.dart';
// Color personalizado
const Color _customColor = Color.fromARGB(255, 51, 33, 209);
// Lista de colores
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

// Clase para el tema de la aplicación
class AppTheme {

  // Índice del color seleccionado dentro de la lista _colorThemes
  final int selectedColor;

  // Constructor de AppTheme 
  AppTheme({
    this.selectedColor = 0
  }) : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
        "Colors must be between 0 and ${_colorThemes.length}"
      );

  // Método que define y devuelve un objeto ThemeData para aplicar el tema en la aplicación
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, // Activa el estilo Material 3
      colorSchemeSeed: _colorThemes[selectedColor] // Establece el color principal del tema
    );
  }
}