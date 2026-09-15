import 'package:dio/dio.dart';
import 'package:ciclo_menstrual/domain/ciclo.dart';

class CicloApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/alaryce/fake_api_aj';

  Future<List<Ciclo>> listar() async {
    final response = await dio.get('$baseUrl/ciclo');

    if (response.statusCode == 200) {
      List<dynamic> listaJson = response.data;
      return listaJson.map((json) => Ciclo.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar ciclos');
    }
  }
}