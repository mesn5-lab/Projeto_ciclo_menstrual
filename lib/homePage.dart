import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

/*
class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(167, 123, 173, 1),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, -170),
                child: Cartao(),
              ),
            ],
          )
      ),
    );
  }

  Cartao(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 250,
      height: 100,
      child: Center(
        child: Text("oi"),
      ),
    );
  }
}*/

class _HomePage extends State<HomePage>{
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
                  //ícone de voltar e título
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(157, 88, 209, 1.0), size: 30, fontWeight: FontWeight.bold,),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Text(
                            "Síndrome do Ovário Policístico - SOP",
                            style: GoogleFonts.openSans(
                              textStyle: GoogleFonts.openSans(
                                color: Color.fromRGBO(157, 88, 209, 1.0),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                shadows: [Shadow(color: Colors.black26, blurRadius: 4)],
                              ),
                            ),
                        ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //Cartão branco
                  Container(
                    width: double.infinity,
                    height: 540,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "O que é a SOP?",
                              style: GoogleFonts.libreBaskerville(
                                textStyle: GoogleFonts.libreBaskerville(
                                  color: Color.fromRGBO(240, 138, 166, 1.0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Uma condição hormonal comum que afeta a ovulação...",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color.fromRGBO(240, 138, 166, 1.0),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Sintomas de alerta
                          _buildSecaoTitulo("Sintomas de Alerta"),
                          _buildItemComIcone(Icons.calendar_month, "Irregularidade menstrual"),
                          _buildItemComIcone(Icons.content_cut, "Excesso de pelos"),
                          _buildItemComIcone(Icons.face, "Acne persistente"),
                          _buildItemComIcone(Icons.monitor_weight, "Ganho de peso"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Como identificar
                          _buildSecaoTitulo("Como Identificar"),
                          _buildItemComBolinha("Exame físico"),
                          _buildItemComBolinha("Ultrassom transvaginal"),
                          _buildItemComBolinha("Exames de sangue"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          _buildSecaoTitulo("Formas de Tratamento"),
                          _buildItemComBolinha("Recomendação médica"),
                          _buildItemComBolinha("Anticoncepcionais"),
                          _buildItemComBolinha("Dieta e exercícios"),
                          _buildItemComBolinha("Medicamentos"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSecaoTitulo(String titulo){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        titulo,
        style: GoogleFonts.libreBaskerville(
          textStyle: TextStyle(
            color: Color.fromRGBO(240, 138, 166, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildItemComIcone(IconData icone, String texto){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(icone, color: Colors.grey, size: 18),
          const SizedBox(width: 10),
          Text(
            texto,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(color: Color.fromRGBO(240, 138, 166, 1.0), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemComBolinha(String texto){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: Color.fromRGBO(240, 138, 166, 1.0), shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Text(
            texto,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(color: Color.fromRGBO(240, 138, 166, 1.0), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
