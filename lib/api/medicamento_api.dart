import 'package:ciclo_menstrual/domain/medicamento.dart';
import 'package:dio/dio.dart';

class MedicamentoApi {
  final dio = Dio();
  final String baseUrl = 'https://api.fda.gov/drug/drugsfda.json';

  findByName(String name) async {
    late Medicamento medicamento;
    final response = await dio.get('$baseUrl?search=openfda.brand_name:"$name"&limit=1');

    if (response.statusCode == 200) {
      medicamento = Medicamento.fromJson(response.data);
    }

    return medicamento;
  }
}