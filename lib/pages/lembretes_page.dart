import 'package:ciclo_menstrual/db/fake_db_lembretes.dart';
import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/widget/container_lembretes.dart';
import 'package:ciclo_menstrual/db/LembretesDao.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LembretesPage extends StatefulWidget {
  final Lembretes? lembretes;
  const LembretesPage({super.key, this.lembretes});

  @override
  State<LembretesPage> createState() => _LembretesPage();
}

class _LembretesPage extends State<LembretesPage>{
  List<Lembretes> listaLembretes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaLembretes = await LembretesDao().listarLembretes();
    await Future.delayed(Duration(seconds: 2));
    setState(() {

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

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaLembretes.length,
              itemBuilder: (context, index) {
                return ContainerLembretes(
                  lembretes: listaLembretes[index],
                  aoEditar: () {},
                  aoDeletar: () {
                    //remove
                    setState(() {
                      listaLembretes.removeAt(index);
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  "Adicionar lembrete",
                  style: GoogleFonts.libreBaskerville(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
    );

  }
}