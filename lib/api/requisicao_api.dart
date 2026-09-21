import 'package:dio/dio.dart';
import 'package:ciclo_menstrual/domain/ciclo.dart';
import 'dart:convert';

class RequisicaoApi {

  final dio = Dio();
  String baseUrl = 'https://quickchart.io';

  //foundChart(List<Ciclo> listaCiclos) async {
    //late Ciclo ciclo;

    Future<Ciclo> foundChart(List<Ciclo> listaCiclos) async {
      late Ciclo ciclo;
      List<String> meses = listaCiclos.map((c) => c.dataInicio).toList();
      List<int> duracao = listaCiclos.map((c) => c.duracao).toList();

      final Map<String, dynamic> chartConfig = {
        'type': 'bar',
        'data': {
          'labels': meses,
          'datasets': [
            {
              'label': 'Duração do Ciclo (Dias)',
              'data': duracao,
              'backgroundColor': 'rgba(233, 30, 99, 0.7)',
              'borderColor': 'rgb(233, 30, 99)',
              'borderWidth': 1,
            }
          ],
        },
        'options': {
          'title': {
            'display': true,
            'text': 'Histórico de Ciclos Menstruais',
          }
        }
      };

      final String jsonConfig = jsonEncode(chartConfig);
      final urlFormatada = '$baseUrl/chart?c=${Uri.encodeComponent(
          jsonConfig)}';
      final response = await dio.get(urlFormatada);

      if (response.statusCode == 200) {
        ciclo = Ciclo.fromMap({
          'url': urlFormatada,
          'titulo': 'Histórico de Ciclos Menstruais',
          'totalCiclos': meses.length,
        });
      }
      return ciclo;
    }
  }
