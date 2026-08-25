import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:ciclo_menstrual/db/SintomasDao.dart';

class SintomasPage extends StatefulWidget {
  const SintomasPage({super.key});

  @override
  State<SintomasPage> createState() => _SintomasPage();
}

class _SintomasPage extends State<SintomasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(color: const Color.fromRGBO(216, 180, 226, 1.0)),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/topo.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/rodape.png',
                  fit: BoxFit.fill,
                  //height: 800,
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20),
                  child: buildBody(),
                ),
              ),

          ],
        ),
      ),
    );
  }

  buildBody(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromRGBO(157, 88, 209, 1.0),
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: FittedBox(
                child: Text(
                  "Registrar Sintomas",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF9C27B0),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 65),

        _buildCardSecao("Fluxo", [
          Sintomas(nome: "Leve", icone: Icons.water_drop_outlined),
          Sintomas(nome: "Médio", icone: Icons.opacity),
          Sintomas(nome: "Forte", icone: Icons.water_drop),
        ]),

        //seção dos sintomas
        _buildCardSecao("Sintomas", [
          Sintomas(
            nome: "Cólica",
            icone: Icons.local_fire_department_outlined,
          ),
          Sintomas(nome: "Fadiga", icone: Icons.battery_alert),
          Sintomas(nome: "Dor de cabeça", icone: Icons.psychology),
          Sintomas(nome: "Acne", icone: Icons.face),
          Sintomas(
            nome: "Inchaço",
            icone: Icons.monitor_weight_outlined,
          ),
        ]),

        //seção humor
        _buildCardSecao("Humor", [
          Sintomas(
            nome: "Triste",
            icone: Icons.sentiment_dissatisfied,
          ),
          Sintomas(
            nome: "Irritada",
            icone: Icons.sentiment_very_dissatisfied_outlined,
          ),
          Sintomas(
            nome: "Feliz",
            icone: Icons.sentiment_satisfied_alt_rounded,
          ),
          Sintomas(
            nome: "Ansiosa",
            icone: Icons.sentiment_neutral_outlined,
          ),
        ]),

        const SizedBox(height: 35),

        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9C27B0),
              minimumSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
            ),
            child: Text(
              "Salvar Registro",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildCardSecao(String titulo, List<Sintomas> itens) {
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
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itens.length,
              itemBuilder: (context, index) {
                final item = itens[index];
                return _buildItemSintoma(item.nome, item.icone);
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
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            child: Icon(icone, size: 30, color: Colors.grey[700]),
          ),
          const SizedBox(height: 6),
          Text(
            nome,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
