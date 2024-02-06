import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; // Added path package for proper path handling

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        price REAL,
        imageUrl TEXT,  -- Fixed the typo in TEXT
        createdAt INTEGER NOT NULL DEFAULT (CAST(strftime('%s', 'now') AS INTEGER))
      )
      """);
  }

  static Future<sql.Database> db() async {
    final databasesPath = await getDatabasesPath();
    final path =
        join(databasesPath, 'shoes_data.db'); // Fixed the database name
    return sql.openDatabase(
      path,
      version: 2,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String? title, String? description,
      String? price, String? imageUrl) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<int> updateItem(int id, String title, String? description,
      String price, String imageUrl) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    };

    try {
      final result =
          await db.update('items', data, where: "id = ?", whereArgs: [id]);
      return result;
    } catch (e) {
      debugPrint("Error updating item: $e");
      return 0;
    }
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
