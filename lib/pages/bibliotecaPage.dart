import 'package:ciclo_menstrual/pages/endoPage.dart';
import 'package:ciclo_menstrual/pages/sopPage.dart';
import 'package:ciclo_menstrual/pages/infeccoesPage.dart';
import 'package:ciclo_menstrual/pages/miomasPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/db/fake_db_sintomas.dart';

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
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 9),
                            child: Text(
                              "Biblioteca de Saúde Feminina",
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

                    /*ListView.builder(
                      itemCount: FakeDatabase.listaCondicoes.length,

                      itemBuilder: (context, i) {

                      },
                    ),
*/

                    //Condições e suas respectivas telas
                    _buildCondicoes(
                      context,
                      "Síndrome do Ovário Policístico - SOP",
                      'sop.png',
                      const SopPage(),
                    ),
                    _buildCondicoes(
                      context,
                      "Endometriose e Adenomiose",
                      'endo.png',
                      const EndoPage(),
                    ),
                    _buildCondicoes(
                      context,
                      "Miomas Uterinos",
                      'miomas.png',
                      const MiomasPage(),
                    ),
                    _buildCondicoes(
                      context,
                      "Infecções Comuns (Cervicite, etc.)",
                      'infeccoes.png',
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
                  'assets/images/$imagem',
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