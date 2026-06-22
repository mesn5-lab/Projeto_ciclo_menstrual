import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper_lembretes.dart';

//isola a lógica, fazendo com que todas ações passem primeiro por aqui
class LembretesDao {
  //quando terminar o trabalho vai retornar uma lista de lembretes
  Future<List<Lembretes>> listarLembretes() async {
    //chama a classe auxiliar
    Database db = await DbHelperLembretes().initDB();

    //o resultado vai ser o comando no banco, retornando uma lista de mapas por db.rawQuery
    var result = await db.rawQuery('SELECT * FROM LEMBRETES');

    //cria uma lista vazia
    List<Lembretes> lista = [];
    //loop que vai passar por cada linha
    for (var json in result) {
      //pega a linha bruta do banco e joga dentro do construtor para transformá-la em um objeto apropriado do tipo Lembretes
      Lembretes lembretes = Lembretes.fromJson(json);
      //adiciona os lembretes à lista vazia
      lista.add(lembretes);
    }
    return lista;
  }
}