import 'dart:io';
import 'package:news/src/core/constants.dart';
import 'package:news/src/models/item_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class NewsDbProvider {
  Database? _db;

  NewsDbProvider() {
    _init();
  }
  Future<void> _init() async{
    /// 1. Need a path to where our database resides
    Directory directory = await getApplicationDocumentsDirectory();
    final dbPath = Path.join(directory.path, DB_NAME);
    /// 2 . Either open a existing connection to db or create a database and get the connection

    _db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version){
          Batch batch = db.batch();
          batch.execute(
            """
              CREATE TABLE $NEWS_TABLE (
                id INTEGER PRIMARY KEY AUTO INCREMENT,
                by TEXT,
                descendants INTEGER,
                score INTEGER,
                time INTEGER,
                title TEXT,
                url TEXT,
                type TEXT,
                text TEXT,
                deleted INTEGER,
                dead INTEGER,
                kids BLOB
              )
            """
          );
          batch.commit();
        }
        );
  }

  /// fetch an item with the given id
  Future<ItemModel?> fetchItem(int id) async {
    if(_db == null) await _init();
    final data = await _db!.query(NEWS_TABLE,where: "id = ?", whereArgs: [id]);
    /// select * from news where id = $id
    if(data.isEmpty) return null;
    return ItemModel.fromDb(data.first);

  }
  /// insert an item model
  Future<int> insertItem(ItemModel item) async {
    if(_db == null) await _init();
    return _db!.insert(NEWS_TABLE, item.toDb());
    /// insert into news(id, title, url...) values(1, 'some title', 'https://we.')
  }
}