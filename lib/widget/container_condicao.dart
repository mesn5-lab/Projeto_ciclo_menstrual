import 'package:ciclo_menstrual/domain/Condicao.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerCondicao extends StatefulWidget {
  Condicao condicao;
  
  ContainerCondicao({super.key, required this.condicao});

  @override
  State<ContainerCondicao> createState() => _ContainerCondicaoState();
}

class _ContainerCondicaoState extends State<ContainerCondicao> {
  String get titulo => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.condicao.telaDestino),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(223, 203, 222, 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Transform.scale(
                scale: 0.98,
                child: Image.asset(
                  'assets/images/',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 15),

            Expanded(
              child: Text(
                titulo,
                style: GoogleFonts.libreBaskerville(
                  color: Color.fromRGBO(240, 138, 166, 1.0),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(240, 138, 166, 1.0), size: 18, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
