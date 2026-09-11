import 'package:dio/dio.dart';
import 'package:ciclo_menstrual/domain/grafico.dart';

class RequisicaoApi {

  final dio = Dio();
  String baseUrl = 'https: //quickchart.io';

  foundChart(List<String> meses, List<int> duracao) async {
    late Grafico grafico;

    final jsonConfig = '''
    {
      type: 'polarArea',
      data: {
      labels: ${meses.toString()},
      datasets: [{
         label: 'Duração do Ciclo (Dias)',
         data: ${duracao.toString()},
         backgroundColor 'rgba(233, 30, 99, 0.7)',
         borderColor: 'rgb(233, 30, 99)',
         borderWidth: 1
        }] 
       },
       options: {
         title: {
           display: true,
           text: 'Histórico de Ciclos Menstruais'
           }
         }
       }    
      ''' ;

    final urlFormatada = '$baseUrl/chart?c=${Uri.encodeComponent(jsonConfig)}';
    final response = await dio.get(urlFormatada);

    if (response.statusCode == 200){
      grafico = Grafico.fromJson({
        'url' : urlFormatada,
        'titulo' : 'Histórico de Ciclos Menstruais',
        'totalCiclos' : meses.length,
      });
    }
    return grafico;
  }
}