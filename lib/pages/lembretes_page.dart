import 'package:ciclo_menstrual/db/fake_db_lembretes.dart';
import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/widget/container_lembretes.dart';
import 'package:ciclo_menstrual/db/LembretesDao.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
class LembretesPage extends StatefulWidget {
  final Lembretes? lembretes; //final define que o valor é imutável, ? diz que a variável pode ficar vazia sem interferir no código
  const LembretesPage({super.key, this.lembretes});

  @override
  State<LembretesPage> createState() => _LembretesPage();
}

class _LembretesPage extends State<LembretesPage>{
  List<Lembretes> listaLembretes = [];

  @override
  //método executado apenas na hora de criação, para fazer configurações iniciais
  void initState() {
    super.initState();
    loadData(); //busca os dados, é uma tarefa assíncrona
  }

  loadData() async {
    //a tarefa assíncrona vai até o banco de dados, puxa todas as linhas da tabela e joga nas variáveis
    listaLembretes = await LembretesDao().listarLembretes();
    await Future.delayed(Duration(seconds: 2)); //cria uma pausa forçada
    setState(() { //serve pra preencher a tela, quando há atualização

    });
  }

  @override
  Widget build(BuildContext context){
    final listaLembretes = FakeDatabase_Lembretes.listaLembretes;

    return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Ícone de voltar e título
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Text(
                      "Lembretes",
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

            //lista que cria e destrói os cards de forma fácil e prática
            ListView.builder(
              shrinkWrap: true, //calcula o tamanho exato da lista, baseado na soma dos cards
              physics: const NeverScrollableScrollPhysics(), //desativa o poder de rolagem da lista, porque como a tela já tem reolagem se a lista também tivesse acabaria travando
              itemCount: listaLembretes.length, //define quantos itens há na lista
              itemBuilder: (context, index) { //define o molde de cada item
                return ContainerLembretes(
                  lembretes: listaLembretes[index],
                  aoEditar: () {},
                  aoDeletar: () {
                    //remove e atualiza a tela sem o lembrete
                    setState(() {
                      listaLembretes.removeAt(index);
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton( //botão mais dinâmico
                onPressed: () {},
                style: ElevatedButton.styleFrom(//define as configurações visuais do botão, centralizando-as
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  "Adicionar lembrete",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

          ],
        ),
    );

  }
}