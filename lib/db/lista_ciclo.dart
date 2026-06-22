import 'package:ciclo_menstrual/domain/ciclo.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper_sintomas.dart';

class CicloDao {

  Future<List<Ciclo>> listarCiclos() async {

    Database db = await DBHelper().initDB();

    var result = await db.rawQuery(
        'SELECT * FROM CICLO'
    );

    List<Ciclo> lista = [];

    for (var json in result) {

      Ciclo ciclo = Ciclo.fromMap(json);

      lista.add(ciclo);
    }

    return lista;
  }
}