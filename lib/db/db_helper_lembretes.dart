import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperLembretes {
  //Future<Database> significa que no futuro vai efetuar uma tarefa em segundo plano e quando terminar vai entregar o objeto do tipo Database pronto
  //initDB() localiza o espaço correto
  //async manda o Flutter esperar
  Future<Database> initDB() async {
    //busca o caminho das chaves; await faz o código parar nessa linha e esperar até que o caminho da pasta seja retornado
    //getDatabasesPath(): função que pergunta em qual pasta pode guardar os arquivos de banco de dados do aplicativo
    String path = await getDatabasesPath();
    String dbName = 'lembretes.db';

    String dbPath = join(path, dbName); //join(path, dbName): função que cola o caminho da pasta com o nome do arquivo corretamente

    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    //Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);: função que abre o banco de dados segundo uma condição
    //se o arquivo não existir o Flutter cria um do zero pelo onCreateDB, na versão 1; se existir o Flutter apenas ignora o onCreateDb e abre o arquivo

    return db;
  }

  //Future<void> apenas executa comandos, sem retornar nada
  Future<void> onCreateDB(Database db, int version) async {
    //cria a tabela; as aspas triplas permitem a quebra de linhas
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
