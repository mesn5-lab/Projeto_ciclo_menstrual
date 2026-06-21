import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/pages/home_fixed.dart';
import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:ciclo_menstrual/db/fake_db_sintomas.dart';

class SintomasPage extends StatefulWidget{
  final Sintomas? sintomas;
  const SintomasPage({super.key, this.sintomas});

  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  @override
  Widget build(BuildContext context) {
    final listaDeFluxo = FakeDatabase.secaoFluxo;
    final listaDeSintomas = FakeDatabase.secaoSintomas;
    final listaDeHumor = FakeDatabase.secaoHumor;

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

            _buildCardSecao("Fluxo", listaDeFluxo),
            _buildCardSecao("Sintomas", listaDeSintomas),
            _buildCardSecao("Humor", listaDeHumor),

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
  Widget _buildCardSecao(String titulo, List listadoBanco) {
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

          //colocamos aqui o LISTVIEW, junto com um espaço para que o querido possa respirar
          SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, //rola pro lado
                itemCount: listadoBanco.length, //dinamiza a lista passada
                itemBuilder: (context, index) {
                  final item = listadoBanco[index];
                  return _buildItemSintoma(item.nome, item.icone);
                  //retorna o widget com o design
                },
            ),
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