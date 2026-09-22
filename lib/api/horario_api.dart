import 'package:ciclo_menstrual/domain/horario.dart';
import 'package:dio/dio.dart';

class HorarioApi {
  final dio = Dio();
  final String baseUrl = 'https://time.now/developer/api';

  Future<Horario?> findAll() async {
    late Horario horario;
    final response = await dio.get('$baseUrl/timezone/Brazil/East');

    if (response.statusCode == 200) {
      horario = Horario.fromJson(response.data);
    }

    return horario;
  }
}
