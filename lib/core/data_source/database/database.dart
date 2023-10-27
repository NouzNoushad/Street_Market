import 'package:ecom_clean_architecture/core/data_source/database/db_consumer.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StreetMarketDatabase extends DatabaseConsumer{
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(AppStrings.databaseName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT NOT NULL,
        title TEXT NOT NULL,
        price INTEGER NOT NULL,
        category TEXT NOT NULL,
        count INTEGER NOT NULL,
      )
      ''');
  }
}
