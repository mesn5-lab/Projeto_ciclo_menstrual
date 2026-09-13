import 'package:ciclo_menstrual/domain/medicamento.dart';
import 'package:dio/dio.dart';

class MedicamentoApi {
  final dio = Dio();
  /*final String baseUrl = 'https://api.fda.gov/drug/drugsfda.json';

  findByName(String name) async {
    late Medicamento medicamento;
    final response = await dio.get('$baseUrl?search=openfda.brand_name:"$name"&limit=1');

    if (response.statusCode == 200) {
      medicamento = Medicamento.fromJson(response.data);
    }

    return medicamento;
  }*/

  final String baseUrl = 'https://my-json-server.typicode.com/mesn5-lab/Fake_api';

  Future<List<Medicamento>> listarMedicamento() async {
    final response = await dio.get('$baseUrl/medicamentos');

    List<Medicamento> lista = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        Medicamento medicamento = Medicamento.fromJson(json);
        lista.add(medicamento);
      }
    }

    return lista;
  }
}