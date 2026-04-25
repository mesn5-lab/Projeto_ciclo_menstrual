import 'package:ciclo_menstrual/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfeccoesPage extends StatefulWidget{
  const InfeccoesPage({super.key});

  @override
  State<InfeccoesPage> createState() => _InfeccoesPage();
}

class _InfeccoesPage extends State<InfeccoesPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox.expand(
        child:Stack(
          children: [
            //Background floral
            Container(
              color: const Color(0xFFD8B4E2),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/topo.png',
                  fit: BoxFit.cover,
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
                  fit: BoxFit.cover,
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
                              "Infecções Comuns (Cervicite, etc.)",
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
                                "O que é a Cervicite?",
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
                              "É a inflamação que atinge especificamente o colo do útero "
                                  "(a extremidade inferior que se abre para a vagina). "
                                  "Geralmente é causada por infecções sexualmente transmissíveis, "
                                  "como clamídia e gonorreia, mas também pode ser provocada por "
                                  "irritações químicas, uso de dispositivos como diafragmas ou alergia "
                                  "ao látex do preservativo.",
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
                            _buildItemComIcone(Icons.water_drop_rounded, "Corrimento vaginal anormal"),
                            _buildItemComIcone(Icons.bolt, "Dor pélvica"),
                            _buildItemComIcone(Icons.priority_high, "Dor ao urinar"),
                            _buildItemComIcone(Icons.opacity, "Sangramento vaginal inusitado"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //Seção: Como identificar
                            _buildSecaoTitulo("Como Identificar"),
                            _buildItemComBolinha("Exame ginecológico"),
                            _buildItemComBolinha("Exame de urina"),
                            _buildItemComBolinha("Cultura de secreção"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            _buildSecaoTitulo("Formas de Tratamento"),
                            _buildItemComBolinha("Antibióticos"),
                            _buildItemComBolinha("Antivirais"),
                            _buildItemComBolinha("Antifúngicos"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "O que é a Endometrite?",
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
                              "Trata-se da inflamação ou infecção do endométrio, que "
                                  "é o tecido que reveste a parte interna do útero. "
                                  "Diferente da endometriose, a endometrite é quase sempre "
                                  "causada por bactérias que sobem do trato vaginal, sendo "
                                  "muito comum após o parto (especialmente cesáreas), abortos, "
                                  "ou procedimentos médicos que atravessam o colo do útero, como a "
                                  "biópsia uterina.",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(240, 138, 166, 1.0),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //Seção: sintomas de alerta
                            _buildSecaoTitulo("Sintomas de Alerta"),
                            _buildItemComIcone(Icons.thermostat, "Febre"),
                            _buildItemComIcone(Icons.bolt, "Dor abdominal"),
                            _buildItemComIcone(Icons.local_hospital, "Útero amolecido ou dolorido"),
                            _buildItemComIcone(Icons.warning_amber, "Corrimento com odor fétido"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //Seção: como identificar
                            _buildSecaoTitulo("Como Identificar"),
                            _buildItemComBolinha("Histórico médico"),
                            _buildItemComBolinha("Exames de sangue"),
                            _buildItemComBolinha("Biópsia do endométrio"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //Seção: formas de tratamento
                            _buildSecaoTitulo("Formas de Tratamento"),
                            _buildItemComBolinha("Antibióticos"),
                            _buildItemComBolinha("Anti-inflamatório"),
                            _buildItemComBolinha("Tratamento da causa base"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "O que é a Doença Inflamatória Pélvica?",
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
                              "É uma infecção que começa no colo do útero ou na vagina e "
                                  "sobe"" para os órgãos reprodutores superiores. Ela não "
                                  "afeta apenas o útero, mas também as trompas de Falópio e os "
                                  "ovários. É considerada uma evolução grave de infecções não "
                                  "tratadas e é uma das principais causas de dor pélvica crônica e "
                                  "infertilidade feminina, pois pode causar cicatrizes e obstruções "
                                  "nas trompas.",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(240, 138, 166, 1.0),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //seção: sintomas de alerta
                            _buildSecaoTitulo("Sintomas de Alerta"),
                            _buildItemComIcone(Icons.bolt, "Dor pélvica"),
                            _buildItemComIcone(Icons.warning_amber, "Corrimento atípico"),
                            _buildItemComIcone(Icons.opacity, "Sangramento inesperado"),
                            _buildItemComIcone(Icons.thermostat_auto_outlined, "Sinais de infecção aguda"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //seção: como identificar
                            _buildSecaoTitulo("Como Identificar"),
                            _buildItemComBolinha("Exame físico"),
                            _buildItemComBolinha("Análise de secreção"),
                            _buildItemComBolinha("Exames de imagem"),
                            _buildItemComBolinha("Exames de sangue"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //seção: formas de tratamento
                            _buildSecaoTitulo("Formas de Tratamento"),
                            _buildItemComBolinha("Antibióticos"),
                            _buildItemComBolinha("Repouso e abstinência"),
                            _buildItemComBolinha("Internação"),
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