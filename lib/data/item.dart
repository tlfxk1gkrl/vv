import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Item {
  final int id;
  final int voteId;
  final String text;
  final String imgLink;

  Item(
      {required this.id,
      required this.voteId,
      required this.text,
      required this.imgLink});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'voteId': voteId,
      'text': text,
      'imgLink': imgLink,
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
      join(await getDatabasesPath(), 'Item.db'),
      onCreate: (db, version) {
        return db.execute("""
            CREATE TABLE Item(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT,
            imgLink TEXT,
            voteId INTEGER,
            FOREIGN KEY(voteId) REFERENCES Vote(id) ON DELETE CASCADE
            );   
          """);
      },
      version: 1,
    );
    return 1;
  }

  //create
  Future<int?> insertItem(int voteId, String text, String imgLink) async {
    final db = await database;

    await db.rawQuery('INSERT INTO Item(voteId,text,imgLink) VALUES(?,?,?)',
        [voteId, text, imgLink]);

    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Item'));

    return count;
  }

  //list
  Future<List<Item>> items(int voteId) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Item', where: 'voteId=?', whereArgs: [voteId]);

    return List.generate(
        maps.length,
        (index) => Item(
              id: maps[index]['id'],
              voteId: maps[index]['voteId'],
              text: maps[index]['text'],
              imgLink: maps[index]['imgLink'],
            ));
  }

  //update
  Future<void> updateItem(Item item) async {
    final db = await database;

    await db.update(
      'Item',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  //delete
  Future<void> deleteItem(int id) async {
    final db = await database;

    await db.delete(
      'Item',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
