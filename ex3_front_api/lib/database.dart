import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDatabase {
  static final FavoritesDatabase _instance = FavoritesDatabase._internal();
  factory FavoritesDatabase() => _instance;
  FavoritesDatabase._internal();

  late final Database database;

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE favorite(label TEXT, context TEXT)');
  }

  open() async {
    database = await openDatabase(
        join(await getDatabasesPath(), 'favorites.db'),
        version: 1,
        onCreate: _onCreate);
  }

}