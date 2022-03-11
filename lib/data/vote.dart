import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Vote {
  final int id;
  final String title;
  final String sub;

  Vote({required this.id, required this.title, required this.sub});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sub': sub,
    };
  }
}

class DBHelper {
  var database;

  DBHelper() {
    //initDB();
  }

  Future<int> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'Vote.db'),
      onCreate: (db, version) {
        return db.execute("""
            CREATE TABLE Vote(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            sub TEXT
            )   
          """);
      },
      version: 1,
    );
    return 1;
  }

  //create
  Future<int> insertVote(String title, String sub) async {
    final db = await database;

    await db.rawQuery('INSERT INTO Vote(title,sub) VALUES(?,?)', [title, sub]);

    int id = db.rawQuery('SELECT id FROM Vote ODER BY id desc limit 1');

    return id;
  }

  //list
  Future<List<Vote>> votes() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Vote');

    return List.generate(
      maps.length,
      (index) => Vote(
          id: maps[index]['id'],
          title: maps[index]['title'],
          sub: maps[index]['sub']),
    );
  }

  //update
  Future<void> updateVote(Vote Vote) async {
    final db = await database;

    await db.update(
      'Vote',
      Vote.toMap(),
      where: 'id = ?',
      whereArgs: [Vote.id],
    );
  }


  //delete
  Future<void> deleteVote(int id) async {
    final db = await database;

    await db.delete(
      'Vote',
      where: 'id=?',
      whereArgs: [id],
    );
  }

}
