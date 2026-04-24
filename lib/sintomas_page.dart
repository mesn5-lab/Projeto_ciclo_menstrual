import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/home_fixed.dart';
import 'home_fixed.dart';

class SintomasPage extends StatefulWidget{
  const SintomasPage({super.key});

  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  @override
  Widget build(BuildContext context) {
    return HomeFixed(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              //a cabeça, a seta e o título
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF9C27B0)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Registrar Sintomas",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9C27B0),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //seção do fluxo
              _buildCardSecao("Fluxo", [
                _buildItemSintoma("Leve", Icons.water_drop_outlined),
                _buildItemSintoma("Médio", Icons.opacity),
                _buildItemSintoma("Forte", Icons.water_drop),
              ]),

              //seção dos sintomas
              _buildCardSecao("Sintomas", [
                _buildItemSintoma("Cólica", Icons.local_fire_department_outlined),
                _buildItemSintoma("Fadiga", Icons.battery_alert),
                _buildItemSintoma("Dor de cabeça", Icons.psychology),
                _buildItemSintoma("Acne", Icons.face),
                _buildItemSintoma("Inchaço", Icons.monitor_weight_outlined),
              ]),

              //seção humor
              _buildCardSecao("Humor", [
                _buildItemSintoma("Triste", Icons.sentiment_dissatisfied),
                _buildItemSintoma("Irritada", Icons.sentiment_very_dissatisfied_outlined),
                _buildItemSintoma("Feliz", Icons.sentiment_satisfied_alt_rounded),
                _buildItemSintoma("Ansiosa", Icons.sentiment_neutral_outlined),
              ]),
              
              const SizedBox(height: 30),
              
              //botão para salvar
              ElevatedButton(onPressed: () {
                //ação para salvar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C27B0),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
              ),
              child: Text(
                "Salvar Registro",
                style: GoogleFonts.poppins(fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black),
              ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      );
  }

  //criar os widgets para os builds
  Widget _buildCardSecao(String titulo, List<Widget> itens) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusGeometry.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: itens),
          ),
        ],
      ),
    );
  }

  //criar cada ícone com o texto, o build
  Widget _buildItemSintoma(String nome, IconData icone) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            child: Icon(icone, size: 30, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            nome,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black87
            ),
          ),
        ],
      ),
    );
  }
}
