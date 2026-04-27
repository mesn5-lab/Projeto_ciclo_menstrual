import 'package:flutter/material.dart';
import 'package:projetoapp/Telarelatorio.dart';
import 'Telaconfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaRelatorio(),
    );
  }
}