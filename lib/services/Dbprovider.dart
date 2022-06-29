import 'dart:async';
import '/models/Kullanici.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUsers {

  static final DbUsers _dbUsers = DbUsers._internal();

  DbUsers._internal();

  factory DbUsers() {
    return _dbUsers;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    var dbUsers = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbUsers;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, surname TEXT, email TEXT)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('users');
  }

  Future<void> insertUser(User user) async {
    final Database? db = await this.db;
    await db?.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<User>> users() async {
    // Get a reference to the database.
    final Database? db = await this.db;
    // Query the table for all The Dogs.
    final List<Map<String, Object?>>? maps = await db?.query('users');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps!.length, (i) {
      return User(
        id: int.parse(maps[i]['id'].toString()),
        name: maps[i]['name'].toString(),
        surname: maps[i]['surname'].toString(),
        email: maps[i]['email'].toString(),
      );
    });
  }

  Future<void> updateUser(User user) async {
    final db = await this.db;
    await db?.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await this.db;
    await db?.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
