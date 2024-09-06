import 'package:ex3_front_api/database.dart';
import 'package:ex3_front_api/model/favorite.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesRepository extends ChangeNotifier {
  List<Favorite> _favorites = [];
  final _tableName = 'favorite';
  final Database _db = FavoritesDatabase().database;

  get count => _favorites.length;

  FavoritesRepository() {
    _db.query(_tableName).then((datas) {
      _favorites = datas.map((e) => Favorite.fromMap(e)).toList();
      notifyListeners();
    });
  }

  add(Favorite favorite) {
    _favorites.add(favorite);
    _db.insert(_tableName, favorite.toMap());
    notifyListeners();
  }

  remove(Favorite favorite) {
    _favorites.remove(favorite);
    _db.delete(_tableName,
      where: 'label=?',
      whereArgs: [favorite.label],);
    notifyListeners();
  }

  get(int index) => _favorites[index];

  isFavorite(Favorite favorite) {
    return _favorites.contains(favorite);
  }

}