import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';

class Medicamento {
  late String nome;
  late String dose;
  late String tipo_icone;
  late String motivo;

  Medicamento({
    required this.nome,
    required this.dose,
    required this.tipo_icone,
    required this.motivo,
  });

  Medicamento.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    dose = json['dose'];
    tipo_icone = json['tipo_icone'];
    motivo = json['motivo'];
  }

  static getIcon(String? tipoIcone) {
    if (tipoIcone == 'pilula') {
      return Icons.medical_services;
    }
    return Icons.medication;
  }
}
