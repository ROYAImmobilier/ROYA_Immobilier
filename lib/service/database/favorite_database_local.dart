import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../Model/anonce_model_favote.dart';
import '../../varia_ble/variable.dart';

class CordDatabaseHelper {
  CordDatabaseHelper._();

  static final CordDatabaseHelper db = CordDatabaseHelper._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
      CREATE TABLE $tableFavwall (
         $columnId INTEGER NOT NULL ,
        $columnregion TEXT NOT NULL,
        $columncity TEXT NOT NULL,
        $columntitle TEXT NOT NULL,
        $columncover INTEGER NOT NULL,
        $columnbedrooms INTEGER NOT NULL,
        $columnbathrooms INTEGER NOT NULL,
        $columnapartment INTEGER NOT NULL,
        $columnkitchens INTEGER NOT NULL,
        $columnaddress TEXT NOT NULL,
        $columndescription TEXT NOT NULL,
        $columnadvertiser TEXT NOT NULL,
        $columnphone1 TEXT NOT NULL,
        $columnarea TEXT NOT NULL,
        $columnquartier TEXT NOT NULL
        )
      ''');
    });
  }

  Future<List<FavCategoryItem>> getAllProdects() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableFavwall);
    List<FavCategoryItem> list = maps.isNotEmpty
        ? maps.map((product) => FavCategoryItem.fromJson(product)).toList()
        : [];

    return list;
  }

  inser(FavCategoryItem model) async {
    var dbClient = await database;
    print(dbClient);
    await dbClient!.insert(tableFavwall, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  removeProducs(FavCategoryItem model) async {
    var dbClient = await database;
    return await dbClient!
        .delete(tableFavwall, where: '$columnId=?', whereArgs: [model.id]);
  }
}
