import 'package:ciclo_menstrual/homePage.dart';
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(167, 123, 173, 1),
      body: Stack(
        children: [
          //Background Floral
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(167, 123, 173, 1),
              image: const DecorationImage(
                image: AssetImage('assets/images/widht_740.png'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
          ),

          SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
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
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Text(
                              "Biblioteca de Saúde Feminina",
                              style: GoogleFonts.openSans(
                                textStyle: GoogleFonts.openSans(
                                  color: Color.fromRGBO(157, 88, 209, 1),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: [Shadow(color: Colors.black26, blurRadius: 4.0)],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    //Condições e suas respectivas telas
                    _buildCondicoes(
                      context,
                      "Síndrome do Ovário Policístico - SOP",
                      'assets/images/width_740.png',
                      const HomePage(),
                    ),
                  ],
                ),
              ),
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
              height: 90,
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
                style: GoogleFonts.openSans(
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