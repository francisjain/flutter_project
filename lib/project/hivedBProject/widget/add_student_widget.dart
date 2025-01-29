import 'package:brocode_tutorial_1/project/hivedBProject/db/db_models/studentModels.dart';
import 'package:brocode_tutorial_1/project/hivedBProject/db/functions/db_functions.dart';
import 'package:flutter/material.dart';

class AddStudentDetail extends StatefulWidget {
  const AddStudentDetail({super.key});

  @override
  State<AddStudentDetail> createState() => _AddStudentDetailState();
}

class _AddStudentDetailState extends State<AddStudentDetail> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Age',
            )),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            onPressed: addStudentData,
            icon: const Icon(Icons.add),
            label: const Text('Add')),
      ],
    );
  }

  Future<void> addStudentData() async {
    final _name = _nameController.text;
    final _age = _ageController.text;
    if (_name == '' || _age == '') {
      return;
    }

    final student = StudentModels(name: _name, age: _age);
    addStudent(student);
  }
}
