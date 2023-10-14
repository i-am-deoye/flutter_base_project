import 'package:flutter_base_project/core/entities/base.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/local.database.dart';



mixin SQLDatabaseMixin {

  final insertLocalProvider = FutureProvider.family<dynamic, Entity>((ref, entity) async {
    final sql = SQLDatabase();
    return sql.insert(entity);
  });

  final updateLocalProvider = FutureProvider.family<dynamic, Entity>((ref, entity) async {
    final sql = SQLDatabase();
    return sql.update(entity.id, entity);
  });

  final deleteLocalProvider = FutureProvider.family<dynamic, Entity>((ref, entity) async {
    final sql = SQLDatabase();
    return sql.delete(entity.tableName(), entity.id);
  });


  final fetchLocalProvider = FutureProvider.family<dynamic, String>((ref, tableName) async {
    final sql = SQLDatabase();
    return sql.fetch(tableName);
  });
}