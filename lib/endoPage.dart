import 'package:ciclo_menstrual/bibliotecaPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndoPage extends StatefulWidget{
  const EndoPage({super.key});

  @override
  State<EndoPage> createState() => _EndoPage();
}

class _EndoPage extends State<EndoPage>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
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
                            "Endometriose e Adenomiose",
                            style: GoogleFonts.libreBaskerville(
                              textStyle: GoogleFonts.libreBaskerville(
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
                              "O que é a Endometriose?",
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
                            "A endometriose é uma doença inflamatória crônica caracterizada pelo crescimento de tecido semelhante ao endométrio "
                                "- a camada que reveste internamente o útero - em locais fora da cavidade uterina. Normalmente, esse tecido descama "
                                "e é expelido durante a menstruação, mas, na endometriose, ele pode se fixar nos ovários, trompas de Falópio, intestino, "
                                "bexiga e outros tecidos pélvicos. Mesmo fora do útero, essas células continuam respondendo aos hormônios do ciclo menstrual, "
                                "inflamando e sangrando mensalmente. Como esse sangue não tem por onde sair, ele causa dor intensa, inflamação e a formação de "
                                "cicatrizes ou aderências entre os órgãos.",
                            style: GoogleFonts.libreBaskerville(
                                color: Color.fromRGBO(240, 138, 166, 1.0),
                                fontSize: 16,
                              ),
                            ),
                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Sintomas de alerta
                          _buildSecaoTitulo("Sintomas de Alerta"),
                          _buildItemComIcone(Icons.bolt, "Cólicas menstruais intensas"),
                          _buildItemComIcone(Icons.monitor_heart, "Dor pélvica crônica"),
                          _buildItemComIcone(Icons.child_care, "Dificuldade para engravidar"),
                          _buildItemComIcone(Icons.battery_alert, "Fadiga Extrema"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Como identificar
                          _buildSecaoTitulo("Como Identificar"),
                          _buildItemComBolinha("Histórico clínico"),
                          _buildItemComBolinha("Exame do toque"),
                          _buildItemComBolinha("Ultrassom transvaginal com preparo intestinal"),
                          _buildItemComBolinha("Ressonância magnética"),
                          _buildItemComBolinha("Laparoscopia"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          _buildSecaoTitulo("Formas de Tratamento"),
                          _buildItemComBolinha("Recomendação médica"),
                          _buildItemComBolinha("Dieta anti-inflamatória"),
                          _buildItemComBolinha("Fisioterapia pélvica"),
                          _buildItemComBolinha("Exercícios físicos"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "O que é a Adenomiose?",
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
                            "A adenomiose é uma condição ginecológica caracterizada pela infiltração do endométrio "
                                "— o tecido que reveste a cavidade interna do útero — nas paredes musculares do próprio órgão, "
                                "chamadas de miométrio. Em um ciclo normal, o endométrio engrossa para receber um embrião e, caso não ocorra gravidez, "
                                "é expelido na menstruação. Na adenomiose, esse tecido que ""entrou"" no músculo continua se comportando da "
                                "mesma forma: ele sangra e inflama a cada ciclo, mas como o sangue está preso dentro da musculatura uterina, ele causa uma "
                                "irritação profunda e um aumento significativo do volume do útero.",
                            style: GoogleFonts.libreBaskerville(
                              textStyle: TextStyle(
                                color: Color.fromRGBO(240, 138, 166, 1.0),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Sintomas de alerta
                          _buildSecaoTitulo("Sintomas de Alerta"),
                          _buildItemComIcone(Icons.opacity, "Fluxo menstrual muito intenso"),
                          _buildItemComIcone(Icons.bolt, "Cólicas incapacitantes"),
                          _buildItemComIcone(Icons.add_circle_outline, "Inchaço abdominal"),
                          _buildItemComIcone(Icons.monitor_heart, "Dor crônica"),
                          _buildItemComIcone(Icons.hourglass_bottom, "Longos períodos de sangramento"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          //Seção: Como identificar
                          _buildSecaoTitulo("Como Identificar"),
                          _buildItemComBolinha("Exame físico"),
                          _buildItemComBolinha("Ultrassom transvaginal"),
                          _buildItemComBolinha("Ressonância magnética da pelve"),

                          const Divider(height: 40, thickness: 1, color: Colors.black),

                          _buildSecaoTitulo("Formas de Tratamento"),
                          _buildItemComBolinha("Medicamentos hormonais"),
                          _buildItemComBolinha("Anti-inflamatórios"),
                          _buildItemComBolinha("Embolização da artéria uterina"),
                          _buildItemComBolinha("Ablação de endométrio"),
                          _buildItemComBolinha("Histerectomia"),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: Color.fromRGBO(240, 138, 166, 1.0), shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Text(
              texto,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(color: Color.fromRGBO(240, 138, 166, 1.0), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}