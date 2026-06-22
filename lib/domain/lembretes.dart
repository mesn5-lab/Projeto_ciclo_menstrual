import 'package:flutter/cupertino.dart';

class Lembretes {
  late String medicamento;
  late String dose;
  late String horario;
  late IconData tipo_icone;
  late String motivo;

  Lembretes({
   required this.medicamento,
   required this.dose,
   required this.horario,
   required this.tipo_icone,
   required this.motivo,
});

  Lembretes.fromJson(Map<String, dynamic> json){
    medicamento = json['medicamento'];
    dose = json['dose'];
    horario = json['horario'];
    tipo_icone = json['tipo_icone'];
    motivo = json['motivo'];
  }
}

