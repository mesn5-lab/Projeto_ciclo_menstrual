import 'package:ciclo_menstrual/endoPage.dart';
import 'package:ciclo_menstrual/homePage.dart';
import 'package:ciclo_menstrual/infeccoesPage.dart';
import 'package:ciclo_menstrual/miomasPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Estrutura da página: Stateful = widget com estado => pode "mudar de estado"
class BibliotecaPage extends StatefulWidget{
  const BibliotecaPage({super.key}); //identifica a tela, específico

  @override
  State<BibliotecaPage> createState() => _BibliotecaPage(); //"cérebro" da página
}

class _BibliotecaPage extends State<BibliotecaPage>{
  @override
  //corpo da página
  Widget build(BuildContext context){
    return Scaffold( //estrutura básica
      body: SizedBox.expand( //faz com que o conteúdo ocupe a tela inteira, sem deixar espaço vazio
        child: Stack( //permite colocar uma coisa em cima da outra, formar camadas
          children: [
            SafeArea( //evita com que o conteúdo fique escondido na barra superior do celular ou na câmera
              child: SingleChildScrollView( //permite arrastar o dedo para cima e para baixo
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column( //organiza os elementos um embaixo do outro
                  crossAxisAlignment: CrossAxisAlignment.start, //alinha o conteúdo na horizontal do lado esquerdo
                  children: [
                    Row( //organiza o ícone e o texto horizontalmente
                      children: [
                        IconButton( //botão de voltar
                          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(157, 88, 209, 1), size: 30, fontWeight: FontWeight.bold),
                          onPressed: () {}, //volta para a tela anterior
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
              ),
            ),
          ],
        ),
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
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(17),
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
              height: 100,
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
}