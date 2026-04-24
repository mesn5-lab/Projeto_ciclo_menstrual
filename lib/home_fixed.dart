import 'package:flutter/material.dart';
import 'package:ciclo_menstrual/sintomas_page.dart';
import 'home_page.dart';
//importar as outras telas aqui

//criando uma classe para o arquivo
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
    HomePage(),
    const Center(child: Text("Biblioteca")),
    const Center(child: Text("Soluções")),
    const Center(child: Text("Relatórios")),//a tela que eu criei
    //as telas que serão criadas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. A barra de navegação fica aqui embaixo, fora do body
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
          BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: 'Soluções'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),

      // 2. APENAS UM body para tudo
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Camada 1: O fundo colorido (base)
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

            // Camada 4: O fundo fixo extra (se você ainda precisar dele)
            _buildFundoFixo(),

            // Camada 5: A TELA ATUAL (fica por cima de tudo)
            // Se quiser que o conteúdo da tela fique abaixo das imagens,
            // mude a ordem desta linha na lista.
            SafeArea(
                child: widget.child ?? _telas[_indiceAtual],
            ),
          ],
        ),
      ),
    );
  }

  //criando o build usado acima
  Widget _buildFundoFixo() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/fundo floral.png'),
          fit: BoxFit.cover,
      ),
    )
    );
  }
}