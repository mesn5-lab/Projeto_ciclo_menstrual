import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:ciclo_menstrual/pages/sintomas_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerSintomas extends StatefulWidget {
  Sintomas sintomas;

  ContainerSintomas({super.key, required this.sintomas});

  @override
  State<ContainerSintomas> createState() => _ContainerSintomasState();
}
  class _ContainerSintomasState extends State<ContainerSintomas>{
    @override
    Widget build(BuildContext context){
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SintomasPage(sintomas: widget.sintomas);
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 100,
                      color: Colors.grey.shade100,
                      child: Icon(
                        widget.sintomas.icone,
                        size: 40,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Text(
                widget.sintomas.nome,
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }