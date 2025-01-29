import 'package:brocode_tutorial_1/project/hivedBProject/widget/add_student_widget.dart';
import 'package:brocode_tutorial_1/project/hivedBProject/widget/list_student_widget.dart';
import 'package:flutter/material.dart';

import 'db/functions/db_functions.dart';

class HiveHomepage extends StatelessWidget {
  const HiveHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hive Database',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 20.0,
            children: [const AddStudentDetail(), Expanded(child: ListStudentDetails())],
          ),
      ),
    );
  }
}
