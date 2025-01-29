

import 'package:hive_flutter/hive_flutter.dart';
part 'studentModels.g.dart';

@HiveType(typeId: 0)
class StudentModels {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  StudentModels({required this.name, required this.age,this.id});
}