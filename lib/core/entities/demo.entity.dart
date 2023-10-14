


import 'base.entity.dart';

class DemoEntity implements Entity {
  static String create = 'CREATE TABLE <table-name>(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';

  @override
  final int id;
  final String name;
  final int age;

  const DemoEntity({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String tableName() {
    return 'demos';
  }
}