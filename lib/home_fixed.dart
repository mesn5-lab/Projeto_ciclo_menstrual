import 'package:flutter/material.dart';
import 'home.page.dart';
//importar as outras telas aqui

//criando uma classe para o arquivo
class HomeFixed extends StatefulWidget {
  @override
  _HomeFixedState createState() => _HomeFixedState();
}

class _HomeFixedState extends State<HomeFixed> {
  //varíavel que controla qual aba vai está ativa
  int _indiceAtual = 0;

  //agora cria uma lista das telas que serão exibidas no corpo(body)
  final List<Widget> _telas = [
    HomePage(), //a tela que eu criei
    //as telas que serão criadas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //a barra de ícones que vai ficar fixa nas telas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        //diz ao flutter qual ícone destacar
        onTap: (index) {
          //atualiza o estado para mudar de tela
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.water_drop), label: 'Diário'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Biblioteca'),
          BottomNavigationBarItem(
              icon: Icon(Icons.rocket_launch), label: 'Soluções'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),

      //O corpo da tela muda conforme o ícone
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(212, 181, 210, 1.0),
          ),
          //colocamos aqui para não recarregar nunca
          _buildFundoFixo(),

          //Exibe a tela conforme o índice correspondente
          _telas[_indiceAtual],gghh
        ],
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