


abstract class Entity {
  final int id;

  const Entity({required this.id});

  Map<String, dynamic> toMap();
  String tableName();
}