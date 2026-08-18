import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  //se usar o await, é obrigatório usar o async e o Future<TipoDeRetorno>
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'ciclo_menstrual.db';

    //path é o caminho para o banco de dados. Criando
    String dbPath = join(path, dbName);

    //criando o banco de dados
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sqlSintomas = '''CREATE TABLE SINTOMAS (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      icone TEXT NOT NULL,
      categoria TEXT NOT NULL
    ); ''';

    await db.execute(sqlSintomas);

    //===SEÇÃO FLUXO==
    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria ) VALUES ('Leve', 'water_drop_outlined', 'fluxo');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria ) VALUES ('Médio', 'opacity', 'fluxo');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Forte', 'water_drop', 'fluxo');";
    await db.execute(sqlSintomas);


    //===SEÇÃO SINTOMAS==
    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Cólica', 'local_fire_department_outlined', 'sintomas');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Fadiga', 'battery_alert', 'sintomas');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Dor de cabeça', 'psychology', 'sintomas');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Acne', 'face', 'sintomas');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Inchaço', 'monitor_weight_outlined', 'sintomas');";
    await db.execute(sqlSintomas);

    //===SEÇÃO HUMOR==
    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Triste', 'sentiment_dissatisfied', 'humor');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Irritada', 'sentiment_very_dissatisfied_outlined', 'humor');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Feliz', 'sentiment_sastified_alt_rounded', 'humor');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Ansiosa', 'mood_bad_outlined', 'humor');";
    await db.execute(sqlSintomas);

    sqlSintomas = "INSERT INTO Sintomas (nome, icone, categoria) VALUES ('Calma', 'self_improvement_outlined', 'humor');";
    await db.execute(sqlSintomas);

    String sqlCiclo = '''CREATE TABLE ciclo (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT NOT NULL,
      sintoma TEXT NOT NULL,
      duracao INTEGER NOT NULL
    ); ''';

    await db.execute(sqlCiclo);

    String sqlLembretes = '''CREATE TABLE LEMBRETES (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      medicamento TEXT NOT NULL,
      dose TEXT NOT NULL,
      horario TEXT NOT NULL,
      motivo TEXT NOT NULL,
      tipo_icone TEXT NOT NULL,
    )''';

    //espera a criação da tabela e pega os comandos e joga no banco
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
