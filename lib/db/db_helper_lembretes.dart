import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperLembretes {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'lembretes.db';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sqlLembretes = '''CREATE TABLE LEMBRETES (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      medicamento TEXT NOT NULL
      dose TEXT NOT NULL
      horario TEXT NOT NULL
      motivo TEXT NOT NULL
      tipo_icone TEXT NOT NULL
    )''';
    await db.execute(sqlLembretes);

    await db.execute('''
      INSERT INTO LEMBRETES (medicamento, dose, horario, motivo, tipo_icone) 
      VALUES ('Pílula Anticoncepcional', '1 comprimido', '10:00', 'Prevenção de gravidez e controle do ciclo', 'pilula');
    ''');
    await db.execute('''
      INSERT INTO LEMBRETES (medicamento, dose, horario, motivo, tipo_icone)
      VALUES ('Ácido Fólico 5mg', '1 comprimido', '08:00', 'Suplementação pré-concepcional', 'pilula');
    ''');
    await db.execute('''
      INSERT INTO LEMBRETES (medicamento, dose, horario, motivo, tipo_icone)
      VALUES ('Meloxicam 500mg', '1 comprimido (se necessário)', '14:30', 'Alívio de cólicas menstruais intensas', 'dor');
    ''');
    await db.execute('''
      INSERT INTO LEMBRETES (medicamento, dose, horario, motivo, tipo_icone)
      VALUES ('Sulfato Ferroso 40mg', '1 comprimido', '11:45', 'Prevenção de anemia devido ao fluxo intenso', 'pilula');
    ''');
  }
}
