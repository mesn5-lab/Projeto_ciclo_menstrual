import 'package:flutter/material.dart';
import 'package:projeto_ciclo_menstrual/home.page.dart';
import 'package:projeto_ciclo_menstrual/home_fixed.dart';

void main(){
  runApp(AppCicloMenstrual());
}

class AppCicloMenstrual extends StatelessWidget{
  const AppCicloMenstrual({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeFixed(),
    );
  }gg
}