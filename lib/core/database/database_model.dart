import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DataBase{
  late final String _path;
  late final List<String> _onCreateQuereis;
  DataBase({required String path,List<String>? onCreateQuereis}){
    _path = path;
    _onCreateQuereis = onCreateQuereis ?? [];
  }

  Future<Database> _initDataBase() async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(),_path),
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: (db,version){
        for(String query in _onCreateQuereis){
          db.execute(query);
        }
      },
      version: 1,
    );
    return db;
  }

  Future<void> voidQuery(String query) async {
    final Database db = await _initDataBase();
    await db.execute(query);
  }

  Future<List<Map>> returnQuery(String query) async {
    final Database db = await _initDataBase();
    List<Map> response = await db.rawQuery(query);
    return response;
  }
}