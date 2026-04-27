import 'package:ciclo_menstrual/endoPage.dart';
import 'package:ciclo_menstrual/homePage.dart';
import 'package:ciclo_menstrual/infeccoesPage.dart';
import 'package:ciclo_menstrual/miomasPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            padding: EdgeInsets.only(right: 10),
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

                    //Condições e suas respectivas telas
                    _buildCondicoes(
                      context,
                      "Síndrome do Ovário Policístico - SOP",
                      'sop.png',
                      const HomePage(),
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



  Widget _buildIconeRedondo(IconData icone, Color cor, String rotulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Icon(icone, color: cor, size: 35),
        ),
        const SizedBox(height: 2),
        Text(
          rotulo,
          style: GoogleFonts.openSans(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}