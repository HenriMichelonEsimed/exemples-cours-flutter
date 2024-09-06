import 'package:ex2_pages_database/database.dart';
import 'package:ex2_pages_database/models/history_entry.dart';
import 'package:sqflite/sqflite.dart';

class HistoryEntryRepository {
  final _tableName = 'entry';
  final Database _db = HistoryDatabase().database;
  
  insert(HistoryEntry entry) async {
    await _db.insert(_tableName, entry.toMap());
  }
  
  Future<List<HistoryEntry>> getAll() async {
    List<Map<String, dynamic>> maps = await _db.query(
                    _tableName,
                    orderBy: 'date DESC');
    return maps.map((e) => HistoryEntry.fromMap(e)).toList();
  }
}