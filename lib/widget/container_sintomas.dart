import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:ciclo_menstrual/pages/sintomas_page.dart';
import 'package:flutter/material.dart';

class ContainerSintomas extends StatefulWidget {
  Sintomas sintomas;

  ContainerSintomas({super.key, required this.sintomas});

  @override
  State<ContainerSintomas> createState() => _ContainerSintomasState();
}

class _ContainerSintomasState extends State<ContainerSintomas> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SintomasPage(sintomas: widget.sintomas);
        }
        )
      }
    )
  }
}