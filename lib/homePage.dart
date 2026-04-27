import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            //Background floral
            Container(
              color: const Color.fromRGBO(216, 180, 226, 1.0),
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
                padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Text(
                              "Síndrome do Ovário Policístico - SOP",

                              style: GoogleFonts.libreBaskerville(
                                color: Color.fromRGBO(157, 88, 209, 1.0),
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                shadows: [Shadow(color: Colors.black26, blurRadius: 4)],
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
                      height: 560,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
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
                                  color: Color.fromRGBO(240, 138, 166, 1.0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "A Síndrome dos Ovários Policísticos, amplamente conhecida pela sigla SOP, é um distúrbio endócrino que afeta o equilíbrio hormonal feminino, "
                                  "atingindo cerca de 5% a 10% das mulheres em idade reprodutiva. Ela se caracteriza essencialmente por um desequilíbrio na produção de hormônios, "
                                  "onde os ovários produzem uma quantidade maior de andrógenos (hormônios masculinos) do que o habitual. Essa alteração interfere diretamente no processo de "
                                  "ovulação: em vez de liberar um óvulo maduro todos os meses, o corpo pode falhar nesse ciclo, fazendo com que os folículos que deveriam liberar os óvulos fiquem "
                                  "retidos e se transformem em pequenos cistos, dando o aspecto ""policístico"" visualizado em exames de imagem.",
                              style: GoogleFonts.libreBaskerville(
                                color: Color.fromRGBO(240, 138, 166, 1.0),
                                fontSize: 16,
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
      ),
    );
  }
  
  Widget _buildSecaoTitulo(String titulo){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        titulo,
        style: GoogleFonts.libreBaskerville(
          color: Color.fromRGBO(240, 138, 166, 1.0),
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
            style: GoogleFonts.libreBaskerville(
              color: Color.fromRGBO(240, 138, 166, 1.0),
              fontSize: 16,
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
            style: GoogleFonts.libreBaskerville(
              color: Color.fromRGBO(240, 138, 166, 1.0),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
