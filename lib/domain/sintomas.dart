import 'package:flutter/material.dart';
class Sintomas {
  late String nome;
  late IconData icone;

  Sintomas({
    required this.nome,
    required this.icone,
});

  Sintomas.fromJson(Map<String, dynamic> json){
    //json é o texto do banco de dados que pega o que foi guardado e fragmenta
    //nas varíaveis.
    icone = (json['icone']);
    nome = (json['nome']);
  }

  getIcon(String tipoIcone) {
    switch (tipoIcone) {
      //Ícones do Fluxo
      case 'Leve':
        return Icons.water_drop_outlined;
      case 'Médio':
        return Icons.opacity;
      case 'Forte' :
        return Icons.water_drop;

      //Ícones de Sintomas
      case 'cólica':
        return Icons.local_fire_department_outlined;
      case 'fadiga':
        return Icons.battery_alert;
      case 'dor de cabeça':
        return Icons.psychology;
      case 'acne':
        return Icons.face;
      case 'inchaço':
        return Icons.monitor_weight_outlined;

      //Ícones de Humor
      case 'triste':
        return Icons.sentiment_dissatisfied;
      case 'irritada':
        return Icons.sentiment_very_dissatisfied_outlined;
      case 'feliz':
        return Icons.sentiment_satisfied_alt_rounded;
      case 'ansiosa':
        return Icons.sentiment_neutral_outlined;
    }
  }
}