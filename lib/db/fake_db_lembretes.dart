import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:flutter/material.dart';
//
//essa é uma classe com uma lista estática que serve para ver como os cards ficam quando são criados, é um teste
class FakeDatabase_Lembretes {
  static List<Lembretes> listaLembretes = [
    Lembretes(
      medicamento: "Pílula Anticoncepcional",
      dose: "1 comprimido",
      horario: "10:00",
      motivo: "Prevenção de gravidez e controle do ciclo",
      tipo_icone: Icons.medication,
    ),
    Lembretes(
      medicamento: "Ácido Fólico 5mg",
      dose: "1 comprimido",
      horario: "08:00",
      motivo: "Suplementação pré-concepcional",
      tipo_icone: Icons.medication,
    ),
    Lembretes(
      medicamento: "Meloxicam 500mg",
      dose: "1 comprimido (se necessário)",
      horario: "14:30",
      motivo: "Alívio de cólicas menstruais intensas",
      tipo_icone: Icons.local_hospital_outlined,
    ),
    Lembretes(
      medicamento: "Sulfato Ferroso 40mg",
      dose: "1 comprimido",
      horario: "11:45",
      motivo: "Prevenção de anemia devido ao fluxo intenso",
      tipo_icone: Icons.medication,
    ),
  ];
}