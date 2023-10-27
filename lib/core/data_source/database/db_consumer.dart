import 'package:sqflite/sqflite.dart';

abstract class DatabaseConsumer {
  Future<Database> get database;
}
