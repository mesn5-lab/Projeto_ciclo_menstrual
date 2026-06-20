import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LembretesPage extends StatefulWidget {
  const LembretesPage({super.key});

  @override
  State<LembretesPage> createState() => _LembretesPage();
}

class _LembretesPage extends State<LembretesPage>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Ícone de voltar e título
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Text(
                      "Lembretes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.libreBaskerville(
                        color: const Color.fromRGBO(157, 88, 209, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        shadows: [Shadow(color: Colors.black26, blurRadius: 4.0)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),


          ],
        ),
    );

  }
}