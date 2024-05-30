import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piproy/scr/models/api_tipos.dart';
import 'package:sqflite/sqflite.dart';

class DbTiposAplicaciones {
  static late Database _database;
  //static bool _dbInicializada = false;
  static final DbTiposAplicaciones db = DbTiposAplicaciones._();
  DbTiposAplicaciones._();

  Future<Database> get database async {
    // if (_dbInicializada) return _database;
    _database = await initDB();
    // _dbInicializada = true;
    return _database;
  }

  Future<Database> initDB() async {
    Directory docmentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docmentsDirectory.path, 'Vitalfon.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE MenuGrupos(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        nombre TEXT,
        grupo TEXT
        
      )
      ''');
    });
  }

  Future<int> nuevoTipo(ApiTipos nuevo) async {
    final db = await database;
    final resp = await db.insert('MenuGrupos', nuevo.toJson());
    print(resp);
    return resp;
  }

  deleteApi(String grupo, String nombre) async {
    final db = await database;
    await db.rawDelete('DELETE FROM MenuGrupos WHERE nombre = ? AND grupo = ?',
        [nombre, grupo]);

    return;
  }

  Future modificarGrupo(String nombreViejo, String nombreNuevo) async {
    final db = await database;

    await db.rawUpdate('''
    UPDATE MenuGrupos 
    SET grupo = ? 
    WHERE grupo = ?
    ''', [nombreNuevo, nombreViejo]);
  }

  Future modificarNombre(
      String nombreViejo, String nombreNuevo, String menu) async {
    final db = await database;
    await db.rawUpdate('''
    UPDATE MenuGrupos 
    SET nombre = ? 
    WHERE grupo = ? AND nombre = ?
    ''', [nombreNuevo, menu, nombreViejo]);
  }

  Future<int> eliminarGrupo(String grupo) async {
    final db = await database;
    final result =
        await db.delete('MenuGrupos', where: 'grupo=?', whereArgs: [grupo]);
    return result;
  }

  Future<int> eliminarGrupoMP(String nombre) async {
    final db = await database;
    final result =
        await db.delete('MenuGrupos', where: 'grupo=?', whereArgs: [nombre]);

    return result;
  }

  Future<List<Map<String, Object?>>> getAllRegistros() async {
    final db = await database;
    return await db.query('MenuGrupos');

//return resp;
  }

  Future<List<ApiTipos>> obtenerAppsGrupo(String grupo) async {
    final db = await database;
    final result =
        await db.query('MenuGrupos', where: 'grupo=?', whereArgs: [grupo]);
    if (result.isNotEmpty) {
      final resp2 = result.map((s) => ApiTipos.fromJson(s)).toList();
      return resp2;
    } else {
      return [];
    }
  }

  Future inicializar() async {
    final db = await database;
    await db.delete('MenuGrupos');

    return;
  }
}
