import 'package:ciclo_menstrual/domain/horario.dart';
import 'package:dio/dio.dart';

class HorarioApi {
  /*final dio = Dio();
  final String baseUrl = 'https://my-json-server.typicode.com/mesn5-lab/Fake_api';

  Future<List<Horario>> listarHorario() async {
    final response = await dio.get('$baseUrl/horario');

    List<Horario> lista = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        Horario horario = Horario.fromJson(json);
        lista.add(horario);
      }
    }

    return lista;
  }*/

  final dio = Dio();
  final String baseUrl = 'https://time.now/developer/api';

  findAll() async {
    late Horario horario;
    final response = await dio.get('$baseUrl/timezone/America/Brasilia');

    if (response.statusCode == 200) {
      horario = Horario.fromJson(response.data);
    }

    return horario;
  }
}