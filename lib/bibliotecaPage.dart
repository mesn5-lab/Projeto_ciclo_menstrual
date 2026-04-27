import 'package:ciclo_menstrual/endoPage.dart';
import 'package:ciclo_menstrual/homePage.dart';
import 'package:ciclo_menstrual/infeccoesPage.dart';
import 'package:ciclo_menstrual/miomasPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/home_fixed.dart';

class BibliotecaPage extends StatefulWidget{
  const BibliotecaPage({super.key});

  @override
  State<BibliotecaPage> createState() => _BibliotecaPage();
}

class _BibliotecaPage extends State<BibliotecaPage>{
  @override
  Widget build(BuildContext context){
    return  SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   //Ícone de voltar e título
                   Row(
                     children: [
                       IconButton(
                         icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(157, 88, 209, 1), size: 30, fontWeight: FontWeight.bold),
                         onPressed: () {},
                       ),
                       Expanded(
                         child: Padding(
                           padding: EdgeInsets.only(right: 20),
                           child: Text(
                             "Biblioteca de Saúde Feminina",
                             textAlign: TextAlign.center,
                             style: GoogleFonts.libreBaskerville(
                               textStyle: GoogleFonts.libreBaskerville(
                                 color: Color.fromRGBO(157, 88, 209, 1),
                                 fontSize: 30,
                                 fontWeight: FontWeight.bold,
                                 height: 1.3,
                                 shadows: [Shadow(color: Colors.black26, blurRadius: 4.0)],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 15),

                   //Condições e suas respectivas telas
                   _buildCondicoes(
                     context,
                     "Síndrome do Ovário Policístico - SOP",
                     'assets/images/width_740.png',
                     const HomePage(),
                   ),
                   _buildCondicoes(
                     context,
                     "Endometriose e Adenomiose",
                     'assets/images/width_740.png',
                     const EndoPage(),
                   ),
                   _buildCondicoes(
                     context,
                     "Miomas Uterinos",
                     'assets/images/width_740.png',
                     const MiomasPage(),
                   ),
                   _buildCondicoes(
                     context,
                     "Infecções Comuns (Cervicite, etc.)",
                     'assets/images/width_740.png',
                     const InfeccoesPage(),
                   ),
                 ],
               ),
    );
  }

  //Função: condições e suas respectivas telas
  Widget _buildCondicoes(BuildContext context, String titulo, String imagem, Widget telaDestino){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => telaDestino),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(223, 203, 222, 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                  Icons.female,
                  color: Colors.pink,
                  size: 40
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