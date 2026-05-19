import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:ciclo_menstrual/pages/bibliotecaPage.dart';
import 'package:ciclo_menstrual/pages/Telacalen.dart';
import 'package:ciclo_menstrual/pages/Telaconfig.dart';
import 'package:ciclo_menstrual/pages/Telarelatorio.dart';
//importar as outras telas aqui

//criando uma classe para o arquivo, no caso o arquivo que vai mudar confome
//o usuário clique em algum botão
class HomeFixed extends StatefulWidget {
  final Widget? child;
  const HomeFixed({super.key, this.child});

  @override
  _HomeFixedState createState() => _HomeFixedState();
}

class _HomeFixedState extends State<HomeFixed> {
  //varíavel que controla qual aba vai está ativa
  int _indiceAtual = 0;

  //agora cria uma lista das telas que serão exibidas no corpo(body)
  final List<Widget> _telas = [
    const HomePage(),
    const BibliotecaPage(),
    const Calendario(),
    const TelaRelatorio(),
    const TelaConfig(),

    //a tela que eu criei
    //as telas que serão criadas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 1. A barra de navegação fica aqui embaixo, fora do body
      backgroundColor: Color(0xFFD8B4E2),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Diário'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Biblioteca'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Calendário'),
          BottomNavigationBarItem(icon: Icon(Icons.assessment_outlined), label: "Relatório"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
        ],
      ),

      // 2. APENAS UM body para tudo
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Camada 1: O fundo colorido (base)
            //esse primeiro container serve para deixar a cor lilás fixa
            Container(
              color: const Color(0xFFD8B4E2),
            ),

            // Camada 2: Imagem do Topo
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

            // Camada 3: Imagem do Rodapé (ajustei para bottom: 0)
            Positioned(
              bottom: 0, // Mudei de top para bottom para ser um rodapé real
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/images/rodape.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //é uma função organizadora ela retorna o container com
            //o fundo floral que cobre a tela toda
            _buildFundoFixo(),

            SafeArea(
              //camada onde a tela real aparece , a função abaixo serve para
              //mostrar a tela que eu escolhi
                child: widget.child ?? _telas[_indiceAtual],
            ),
          ],
        ),
      ),
    );
  }

  //criando o build usado acima
  Widget _buildFundoFixo() {
    //esse outro container serve para delimitar a imagem floral, garantido
    //que ela fica por toda a tela
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fundo floral.png'),
          fit: BoxFit.cover,
      ),
    )
    );
  }
}