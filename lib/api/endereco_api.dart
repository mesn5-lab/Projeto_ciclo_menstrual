import 'package:ciclo_menstrual/domain/endereco.dart';
import 'package:dio/dio.dart';

class EnderecoApi {
  final dio = Dio();
  String baseUrl = 'https://viacep.com.br';

  buscarEndereco(String cep) async {
    late Endereco endereco;

    final response = await dio.get(
      '$baseUrl/ws/${cep.replaceAll('-', '')}/json/',
    );

    if (response.statusCode == 200) {
      endereco = Endereco.fromJson(response.data);
    }

    return endereco;
  }
}