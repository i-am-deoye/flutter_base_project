
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import '../entities/demo.entity.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';



mixin SQLMixin {
  static const String _databasename = '<DB-NAME>.db';
  static const int _version = 1;

  static FutureOr<void> _onCreate(Database db, int version) {
    return db.execute(
      DemoEntity.create,
    );
  }


  static Future<Database> setup() async {
    WidgetsFlutterBinding.ensureInitialized();

    return openDatabase(
      join(await getDatabasesPath(), _databasename),
      onCreate: _onCreate,
      version: _version,
    );
  }
}