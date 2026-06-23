import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  //se usar o await, é obrigatório usar o async e o Future<TipoDeRetorno>
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'sintomas.db';

    //path é o caminho para o banco de dados. Criando
    String dbPath = join(path, dbName);

    //criando o banco de dados
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE SINTOMAS (
      id INTERGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      icone TEXT NOT NULL
    ); ''';

    await db.execute(sql);

    sql = '''
CREATE TABLE ciclo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  data TEXT NOT NULL,
  sintoma TEXT NOT NULL,
  duracao INTEGER NOT NULL
);
''';

    await db.execute(sql);
    //===SEÇÃO FLUXO==
    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Leve', 'water_drop_outlined', 'fluxo');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Médio', 'opacity', 'fluxo');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Forte', 'water_drop', 'fluxo');";
    await db.execute(sql);


    //===SEÇÃO SINTOMAS==
    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Cólica', 'local_fire_department_outlined', 'sintomas');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Fadiga', 'battery_alert', 'sintomas');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Dor de cabeça', 'psychology', 'sintomas');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Acne', 'face', 'sintomas');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Inchaço', 'monitor_weight_outlined', 'sintomas');";
    await db.execute(sql);

    //===SEÇÃO HUMOR==
    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Triste', 'sentiment_dissatisfied', 'humor');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Irritada', 'sentiment_very_dissatisfied_outlined', 'humor');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Feliz', 'sentiment_sastified_alt_rounded', 'humor');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Ansiosa', 'mood_bad_outlined', 'humor');";
    await db.execute(sql);

    sql = "INSERT INTO Sintomas (nome, icone) VALUES ('Calma', 'self_improvement_outlined', 'humor');";
    await db.execute(sql);
  }
}