

import 'dart:async';

import 'package:flutter_base_project/core/mixin/reflector.mixin.dart';

import 'package:sqflite/sqflite.dart';

import '../entities/base.entity.dart';
import '../mixin/sql.mixin.dart';
import 'package:injectable/injectable.dart';




abstract class ILocalDatabase {
  Future<void> insert<T extends Entity>(T entity) async {}
  Future<void> update<T extends Entity>(int id, T entity) async {}
  Future<void> delete(String table, int id) async {}
  FutureOr<List<T?>?> fetch<T extends Entity>(String table) async { return null; }
}

@Injectable(as: ILocalDatabase)
class SQLDatabase with SQLMixin, ReflectorMixin implements ILocalDatabase {
  static final SQLDatabase __instance = SQLDatabase._internal();
  static late final Database? _database;
  Database? get database => SQLDatabase._database;

  factory SQLDatabase() {
    return __instance;
  }

  SQLDatabase._internal();

  static init() async {
    SQLDatabase._database = await SQLMixin.setup();
  }

  @override
  Future<void> delete(String table, int id) async {
    await database?.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  FutureOr<List<T?>?> fetch<T extends Entity>(String  table) async {
    final List<Map<String, Object?>>? maps = await database?.query(table);
    if (maps == null) return null;

    return List.generate(maps.length, (index) {
      return reflectOn(maps[index]);
    });
  }

  @override
  Future<void> insert<T extends Entity>(T entity) async {
    await database?.insert( entity.tableName(), entity.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  @override
  Future<void> update<T extends Entity>(int id, T entity) async {
    await database?.update(entity.tableName(), entity.toMap(), where: 'id = ?', whereArgs: [id],);
  }
}
