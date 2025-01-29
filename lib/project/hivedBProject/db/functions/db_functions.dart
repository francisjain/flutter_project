import 'package:brocode_tutorial_1/project/hivedBProject/db/db_models/studentModels.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModels>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModels value) async {
  final studentDB = await Hive.openBox<StudentModels>('student_db');
  final _id = await studentDB.add(value);

  value.id = _id ;
  await studentDB.put(_id, value);

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async{
   final studentDB = await Hive.openBox<StudentModels>('student_db');
   studentListNotifier.value.clear();
    
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async{
  final studentDB = await Hive.openBox<StudentModels>('student_db');
  studentDB.delete(id);
  getAllStudents();
}


Future <void> updateStudent(StudentModels value) async{
  final studentDB = await Hive.openBox<StudentModels>('student_db');
  await studentDB.put(value.id, value);
  getAllStudents();
}