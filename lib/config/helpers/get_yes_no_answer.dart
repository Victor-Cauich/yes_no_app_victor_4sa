import 'package:dio/dio.dart';
import 'package:yes_no_app_victor_4sa/domain/entities/message.dart';

class GetYesNoAnswer{

  // Se crea objeto/instancia de la clase dio
  // Para manejar las peticiones HTTP
  final _dio = Dio();

  // Obtener respuesta
  Future<Message> getAnswer() async{
    // Almacenar la peticion Get en una variable
    final response = await _dio.get('https://yesno.wtf/api');
    
    // Generar un error
    throw UnimplementedError();
  }
}