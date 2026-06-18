import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:flutter/material.dart';

class FakeDatabase {
  static List<Sintomas> secaoFluxo = [
    Sintomas(nome: "Leve", icone: Icons.water_drop_outlined),
    Sintomas(nome: "Médio", icone: Icons.opacity),
    Sintomas(nome: "Forte", icone: Icons.water_drop),
  ];

  static List<Sintomas> secaoSintomas = [
    Sintomas(nome: "Cólica", icone: Icons.local_fire_department_outlined),
    Sintomas(nome: "Fadiga", icone: Icons.battery_alert),
    Sintomas(nome: "Dor de cabeça", icone: Icons.psychology),
    Sintomas(nome: "Acne", icone: Icons.face),
    Sintomas(nome: "Inchaço", icone: Icons.monitor_weight_outlined),
  ];

  static List<Sintomas> secaoHumor = [
    Sintomas(nome: "Triste", icone: Icons.sentiment_dissatisfied),
    Sintomas(nome: "Irritada", icone: Icons.sentiment_very_dissatisfied_outlined),
    Sintomas(nome: "Feliz", icone: Icons.face),
    Sintomas(nome: "Ansiosa", icone: Icons.monitor_weight_outlined),
    Sintomas(nome: "Calma", icone: Icons.self_improvement_outlined),
  ];
}