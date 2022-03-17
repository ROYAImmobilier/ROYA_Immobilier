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
$columnadvertiser TEXT NOT NULL,
$columnregion TEXT NOT NULL,
$columncity TEXT NOT NULL,
$columntransaction TEXT NOT NULL,
$columnpropertyType TEXT NOT NULL,
$columnstatus TEXT NOT NULL,
$columnaddress TEXT NOT NULL,
$columnquartier TEXT NOT NULL,
$columnarea TEXT NOT NULL,
$columnprice TEXT NOT NULL,
$columnage TEXT NOT NULL,
$columnfloorType TEXT NOT NULL,
$columnfloor TEXT NOT NULL,
$columnapartment TEXT NOT NULL,
$columnbedrooms TEXT NOT NULL,
$columnbathrooms TEXT NOT NULL,
$columnkitchens TEXT NOT NULL,
$columntitle TEXT NOT NULL,
$columndescription TEXT NOT NULL,
$columnphone1 TEXT NOT NULL,
$columnphone2 TEXT NOT NULL,
$columnphone3 TEXT NOT NULL,
$columnvalidated TEXT NOT NULL,
$columncreatedAt TEXT NOT NULL,
$columncover TEXT NOT NULL, )
      ''');
    });
  }

  Future<List<FavoriteAnnonceModel>> getAllProdects() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProducts);
    List<FavoriteAnnonceModel> list = maps.isNotEmpty
        ? maps
            .map((book) => FavoriteAnnonceModel.fromJson(book.cast()))
            .toList()
        : [];

    return list;
  }

  inser(FavoriteAnnonceModel model) async {
    var dbClient = await database;

    await dbClient!.insert(tableCartProducts, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  removeProducs(FavoriteAnnonceModel model) async {
    var dbClient = await database;
    return await dbClient!
        .delete(tableCartProducts, where: '$columnid=?', whereArgs: [model.id]);
  }
}
