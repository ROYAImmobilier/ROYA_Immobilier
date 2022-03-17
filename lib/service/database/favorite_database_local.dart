import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../Model/anonce_model_favote.dart';
import '../../constante.dart';

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
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          ''' 
          CREATE TABLE $tableCartProducts (
          $columnid TEXT NOT NULL,
          $columnregion TEXT,
          $columncity TEXT,
          $columntitle TEXT NOT NULL,
          $columncover TEXT )
          ''');
    });
  }

  Future<List<FavoriteAnnonceModel>> getAllProdects() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProducts);
    List<FavoriteAnnonceModel> list = maps.isNotEmpty
        ? maps.map((book) => FavoriteAnnonceModel.fromJson(book)).toList()
        : [];

    return list;
  }

  inser(FavoriteAnnonceModel model) async {
    var dbClient = await database;
    print("modeeel : " + model.title);
    await dbClient!.insert(tableCartProducts, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  removeProducs(FavoriteAnnonceModel model) async {
    var dbClient = await database;
    return await dbClient!
        .delete(tableCartProducts, where: '$columnid=?', whereArgs: [model.id]);
  }
}
