import 'package:flutter/cupertino.dart';

class Lembretes {
  late int? id;
  late String medicamento;
  late String dose;
  late String horario;
  late IconData tipo_icone;
  late String motivo;

  Lembretes({
   this.id,
   required this.medicamento,
   required this.dose,
   required this.horario,
   required this.tipo_icone,
   required this.motivo,
});
}