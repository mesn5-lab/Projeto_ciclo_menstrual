import 'package:ciclo_menstrual/domain/medicamento.dart';
import 'package:dio/dio.dart';

class MedicamentoApi {
  final dio = Dio();
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

  Future<bool> salvar(Medicamento medicamento) async {
    try{
      final response = await dio.post(
        'baseUrl/medicamentos',
        data: {
          'nome': medicamento.nome,
          'dose': medicamento.dose,
          'tipo_icone': medicamento.tipo_icone,
          'motivo': medicamento.motivo,
        },
      );

      if(response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch(e) {
      print('Erro ao salvar medicamento via Dio: $e');
      return false;
    }
  }
}
