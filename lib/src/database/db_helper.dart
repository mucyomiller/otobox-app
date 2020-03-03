import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:otobox/src/models/user_model.dart';

class DbHelper {
  static Database _db;
  static const String ID = 'id';
  static const String FULLNAME = 'fullname';
  static const String EMAIL='email';
  static const String DESCRIPTION='description';
  static const String AVATAR='avatar';
  static const String ROLE='role';
  static const String STATUS='status';
  static const String PRIVACY='privacy';
  static const String EDUCATION='education';
  static const String COUNTRY='country';
  static const String PHONE='phone';


  static const String TABLE = 'User';
  static const String DB_NAME = 'otobox.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID TEXT PRIMARY KEY, $FULLNAME TEXT, $EMAIL TEXT, $DESCRIPTION TEXT, $AVATAR TEXT, $ROLE TEXT, $STATUS TEXT, $PRIVACY TEXT, $EDUCATION TEXT, $COUNTRY TEXT, $PHONE TEXT)");
  }

  Future<UserModel> save(UserModel user) async {
    var dbClient = await db;
    await dbClient.insert(TABLE, user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return user;
  }

  Future<UserModel> getUser() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, FULLNAME, EMAIL, DESCRIPTION, AVATAR, ROLE, STATUS, PRIVACY, EDUCATION, COUNTRY, PHONE]);
    return UserModel.fromMap(maps[0]);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(UserModel user) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, user.toMap(), where: '$ID = ?', whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient =  await db;
    dbClient.close();
  }
}
