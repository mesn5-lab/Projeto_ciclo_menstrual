import 'package:flutter/cupertino.dart';

//classe de domínio, que define o objeto
class Lembretes {
  late String medicamento; //late: define que as variáveis são inicializadas depois da criação do objeto
  late String dose;
  late String horario;
  late IconData tipo_icone;
  late String motivo;

  //construtor que passa os parâmetros obrigatórios
  Lembretes({
   required this.medicamento,
   required this.dose,
   required this.horario,
   required this.tipo_icone,
   required this.motivo,
});
//
  //construtor criado para reconstruir o objeto a partir do formato JSON
  Lembretes.fromJson(Map<String, dynamic> json){ //parâmetro que espera receber a estrutura de dados Map: dicionário ou lista, com as chaves do tipo String e os valores de qualquer tipo (dynamic)
    //o código faz o mapeamento "de um pra um", pegando o dado bruto que está guardado no mapa e injetando dentro das variáveis
    medicamento = json['medicamento'];
    dose = json['dose'];
    horario = json['horario'];
    tipo_icone = json['tipo_icone'];
    motivo = json['motivo'];
  }
}

