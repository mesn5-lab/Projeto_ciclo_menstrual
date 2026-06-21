import 'package:ciclo_menstrual/db/SintomasDao.dart';
import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:ciclo_menstrual/widget/container_sintomas.dart';
import 'package:flutter/material.dart';

class ExploresintomaPage extends StatefulWidget {
  const ExploresintomaPage ({super.key});

  @override
  State<ExploresintomaPage> createState() => _ExploresintomasPageState();
}

class _ExploresintomasPageState extends State<ExploresintomaPage> {
  List<Sintomas> listaSintomas = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaSintomas = await SintomasDao().listarSintomas();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
          itemCount: listaSintomas.length,
          itemBuilder: (context, i) {
            return ContainerSintomas(sintomas: listaSintomas[i]);
          },
      ),
    );
  }
}