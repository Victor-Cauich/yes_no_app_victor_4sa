import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_victor_4sa/config/theme/app_theme.dart';
import 'package:yes_no_app_victor_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_victor_4sa/presentation/screens/chat/chat_screen.dart';

// Función principal que inicia la aplicación
void main() => runApp(const Myapp());

// Clase principal de la aplicación que extiende StatelessWidget
class Myapp extends StatelessWidget {
  const Myapp({super.key});
  
  // Método build que configura y construye la estructura de la aplicación
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // MultiProvider permite que varios proveedores estén disponibles en toda la aplicación
      providers: [
        // Define un ChangeNotifierProvider para manejar el estado de ChatProvider
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      // MaterialApp es el contenedor principal de la aplicación
      child: MaterialApp(
        title: 'Yes No App', // Título de la aplicación
        debugShowCheckedModeBanner: false, // Oculta la etiqueta de modo de depuración en la esquina
        theme: AppTheme(selectedColor: 6).theme(), // Aplica el tema de la aplicación con el color seleccionado
        home: const ChatScreen() // Pantalla principal de la aplicación que muestra la interfaz de chat
      ),
    );
  }
}