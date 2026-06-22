import 'package:ciclo_menstrual/domain/ciclo.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper_sintomas.dart';

class CicloDao {

  Future<int> salvar(Ciclo ciclo) async {
    //recebe o objeto ciclo
    Database db = await DBHelper().initDB();
    //abrindo conexao com o banco
    return await db.insert(
      //inserindo os dados na tabela
      'ciclo',
      ciclo.toMap(), //converter em map
    );
  }
    //metodo listar
    Future<List<Ciclo>> listar() async {
      //retorna uma lista de ciclos
      Database db = await DBHelper().initDB();
      List<Map<String, dynamic>> resultado =
      await db.query('ciclo'); //faz uma consulta
      return resultado
          .map((e) => Ciclo.fromMap(e))
          .toList();
    }
    //excluir um ciclo
        Future<int> excluir(int id) async {
          Database db = await DBHelper().initDB();

          return await db.delete(
            'ciclo',
            where: 'id = ?',
            whereArgs: [id],
          );
        }
    }
