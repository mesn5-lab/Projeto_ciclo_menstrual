import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper_lembretes.dart';

class LembretesDao {
  Future<List<Lembretes>> listarLembretes() async {
    Database db = await DbHelperLembretes().initDB();

    var result = await db.rawQuery('SELECT * FROM LEMBRETES');

    List<Lembretes> lista = [];
    for (var json in result) {
      Lembretes lembretes = Lembretes.fromJson(json);
      lista.add(lembretes);
    }
    return lista;
  }
}