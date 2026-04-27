import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Estrutura da página: Stateful = widget com estado => pode "mudar de estado"
class HomePage extends StatefulWidget{
  const HomePage({super.key}); //identifica a tela, específico

  @override
  State<HomePage> createState() => _HomePage(); //"cérebro" da página
}

class _HomePage extends State<HomePage>{
  @override
  //corpo da página
  Widget build(BuildContext context){
    return Scaffold( //estrutura básica
      body: SizedBox.expand( //faz com que o conteúdo ocupe a tela inteira, sem deixar espaço vazio
        child: Stack( //permite colocar uma coisa em cima da outra, formar camadas
          children: [
            SafeArea( //evita com que o conteúdo fique escondido na barra superior do celular ou na câmera
              child: SingleChildScrollView( //permite arrastar o dedo para cima e para baixo
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column( //organiza os elementos um embaixo do outro
                  crossAxisAlignment: CrossAxisAlignment.start, //alinha o conteúdo na horizontal do lado esquerdo
                  children: [
                    Row( //organiza o ícone e o texto horizontalmente
                      children: [
                        IconButton( //botão de voltar
                          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(157, 88, 209, 1.0), size: 30, fontWeight: FontWeight.bold,),
                          onPressed: () {
                            //voltar para a biblioteca; context: tela inicial
                            Navigator.pop(context);
                          },
                        ),
                        Expanded( // faz com que o conteúdo ocupe o espaço sem explodir a tela
                          child: Padding( //margem interna
                            padding: const EdgeInsets.only(right: 15.0), //15px de distância da borda direita
                            child: Text(
                              "Síndrome do Ovário Policístico - SOP",
                              style: GoogleFonts.libreBaskerville(
                                color: Color.fromRGBO(157, 88, 209, 1.0),
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                height: 1.3, //distância entre as linhas do título
                                shadows: [Shadow(color: Colors.black26, blurRadius: 4)], //sombra preta atrás da letra para dar profundidade
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), //espaço constante/fixo vazio que promove distância entre o titulo da página e o conteudo da lista

                    //Cartão branco
                    Container(
                      width: double.infinity, //ocupa toda a largura da tela, de acordo com o padding
                      height: 560,
                      padding: const EdgeInsets.all(20), //distância igual para todas as bordas
                      decoration: BoxDecoration( //visual do container
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20), //arredondamento das bordas
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25), //cor da sombra com transparência sutil
                            blurRadius: 10, //nível de "borrado"
                            offset: Offset(0, 5), //posição da sombra, como se a "luz" viesse de cima
                          )
                        ],
                      ),
                      child: SingleChildScrollView( //permite a rolagem da tela para cima e para baixo
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, //alinha o conteúdo na horizontal do lado esquerdo
                          children: [
                            Padding( //margem interna
                              padding: const EdgeInsets.only(bottom: 8.0), //distância apenas da borda inferior
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
                            const Divider(height: 40, thickness: 1, color: Colors.black), //linha de divisão de seção; height: espaço entre os texto de cima e de baixo; thickness: grossura da linha

                            //Seção: Sintomas de alerta
                            _buildSecaoTitulo("Sintomas de Alerta"), //função que cria o titulo da seção
                            _buildItemComIcone(Icons.calendar_month, "Irregularidade menstrual"), //função que insere um ícone com um texto ao lado
                            _buildItemComIcone(Icons.content_cut, "Excesso de pelos"),
                            _buildItemComIcone(Icons.face, "Acne persistente"),
                            _buildItemComIcone(Icons.monitor_weight, "Ganho de peso"),

                            const Divider(height: 40, thickness: 1, color: Colors.black),

                            //Seção: Como identificar
                            _buildSecaoTitulo("Como Identificar"),
                            _buildItemComBolinha("Exame físico"), //função que insere uma "bolinha" e um texto ao lado, usado em listas de "tópicos"
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

  Widget _buildItemComIcone(IconData icone, String texto){ //cria linhas padronizadas com um icone e um texto
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0), //deixa um sintoma embaixo do outro
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
      padding: const EdgeInsets.symmetric(vertical: 4.0), //espaço vertical livre entre as linhas de sintoma
      child: Row(
        children: [
          Container( //container da bolinha com suas propriedades
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: Color.fromRGBO(240, 138, 166, 1.0), shape: BoxShape.circle), // define um círculo
          ),
          const SizedBox(width: 10), //espaço vazio entre a bolinha e o texto
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
