import 'package:ciclo_menstrual/domain/Condicao.dart';
import 'package:ciclo_menstrual/pages/endoPage.dart';
import 'package:ciclo_menstrual/pages/infeccoesPage.dart';
import 'package:ciclo_menstrual/pages/miomasPage.dart';
import 'package:ciclo_menstrual/pages/sopPage.dart';
import 'package:flutter/material.dart';

class FakeDatabase {
  static List listaCondicoes = [
    Condicao(
      titulo: "Síndrome do Ovário Policístico - SOP",
      imagem: 'sop.png',
      telaDestino: const SopPage(),
    ),
    Condicao(
      titulo: "Endometriose e Adenomiose",
      imagem: 'endo.png',
      telaDestino: const EndoPage(),
    ),
    Condicao(
      titulo: "Miomas Uterinos",
      imagem: 'miomas.png',
      telaDestino: const MiomasPage(),
    ),
    Condicao(
      titulo: "Infecções Comuns (Cervicite, etc.)",
      imagem: 'infeccoes.png',
      telaDestino: const InfeccoesPage(),
    ),
  ];
}
