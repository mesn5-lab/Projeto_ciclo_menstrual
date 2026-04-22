import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiomasPage extends StatefulWidget{
  const MiomasPage({super.key});

  @override
  State<MiomasPage> createState() => _MiomasPage();
}

class _MiomasPage extends State<MiomasPage>{
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
                        onPressed: () {
                          //voltar para a biblioteca
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Text(
                            "Miomas Uterinos",
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
                              "O que são Miomas Uterinos?",
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
                            "Os miomas uterinos, também denominados leiomiomas ou fibromas, são tumores sólidos e "
                                "benignos que se originam no tecido muscular do útero, o miométrio. Eles representam a "
                                "condição ginecológica não cancerígena mais frequente entre mulheres em idade reprodutiva, "
                                "sendo influenciados diretamente pela dinâmica hormonal do organismo, especialmente pela ação "
                                "do estrogênio e da progesterona. Essa dependência hormonal explica por que esses nódulos tendem "
                                "a se desenvolver após a puberdade, crescer durante o período fértil ou na gestação e, frequentemente, "
                                "regredir de tamanho de forma natural após a menopausa. Embora sua causa exata ainda seja objeto de estudo, "
                                "sabe-se que existe uma forte predisposição genética, além de fatores como a obesidade e o histórico familiar que "
                                "aumentam a probabilidade de seu surgimento."
                                "A manifestação clínica dos miomas é extremamente variada e depende quase inteiramente de sua localização e tamanho. "
                                "Eles são classificados como submucosos, quando crescem para dentro da cavidade uterina e costumam causar hemorragias intensas; "
                                "intramurais, quando se desenvolvem dentro das paredes musculares; ou subserosos, quando se projetam para a parte externa do órgão.",
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
                          _buildItemComIcone(Icons.opacity, "Sangramento menstrual excessivo"),
                          _buildItemComIcone(Icons.bolt, "Cólica intensa"),
                          _buildItemComIcone(Icons.sentiment_very_dissatisfied, "Anemia"),
                          _buildItemComIcone(Icons.add_circle_outline, "Aumento abdominal"),
                          _buildItemComIcone(Icons.speed, "Sintomas compressivos"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Como identificar
                          _buildSecaoTitulo("Como Identificar"),
                          _buildItemComBolinha("Exame físico"),
                          _buildItemComBolinha("Ultrassom transvaginal"),
                          _buildItemComBolinha("Ressonância magnética"),
                          _buildItemComBolinha("Histeroscopia"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          _buildSecaoTitulo("Formas de Tratamento"),
                          _buildItemComBolinha("Expectante"),
                          _buildItemComBolinha("Embolização"),
                          _buildItemComBolinha("Miomectomia"),
                          _buildItemComBolinha("Medicamentos"),
                          _buildItemComBolinha("Histerectomia"),
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