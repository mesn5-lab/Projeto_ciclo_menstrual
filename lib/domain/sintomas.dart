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
}