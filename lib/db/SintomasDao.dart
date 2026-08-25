import 'package:ciclo_menstrual/domain/sintomas.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class SintomasDao {
  Future<List<Sintomas>> listarSintomas() async {
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM SINTOMAS');

    List<Sintomas> lista = [];
    for (var json in result) {
      Sintomas sintomas = Sintomas.fromJson(json);
      lista.add(sintomas);
    }

    await Future.delayed(Duration(seconds: 5));
    return lista;
  }
}