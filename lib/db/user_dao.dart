import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import 'usuario.dart';

class UserDao {
  final DBHelper dbHelper = DBHelper();

  Future<void> cadastrarUsuario(
      String nome,
      String email,
      String senha,
      ) async {
    Database db = await dbHelper.initDB();

    Usuario usuario = Usuario(
      nome: nome,
      email: email,
      senha: senha,
    );

    await db.insert(
      'USUARIOS',
      {
        'nome': usuario.nome,
        'email': usuario.email,
        'senha': usuario.senha,
      },
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<bool> login(String email, String senha) async {
    Database db = await dbHelper.initDB();

    List<Map<String, dynamic>> resultado = await db.query(
      'USUARIOS',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    return resultado.isNotEmpty;
  }
}