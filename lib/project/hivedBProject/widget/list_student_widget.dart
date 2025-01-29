import 'package:brocode_tutorial_1/project/hivedBProject/db/db_models/studentModels.dart';
import 'package:brocode_tutorial_1/project/hivedBProject/db/functions/db_functions.dart';
import 'package:flutter/material.dart';

class ListStudentDetails extends StatelessWidget {
  const ListStudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModels> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text('Age: ${data.age}'),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(data.name[0]),
                ),
                trailing: SizedBox(
                  width: 106,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (data.id != null) {
                              deleteStudent(data.id!);
                            } else {
                              print("NO ID Found");
                            }
                          },
                          icon: Icon(Icons.delete)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () => updateBottomSheet(context, data),
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) => const Divider(),
            itemCount: studentList.length,
          );
        });
  }

  Future<void> updateBottomSheet(
      BuildContext context, StudentModels student) async {

    TextEditingController idController =
        TextEditingController(text: student.id?.toString() ?? '');
    TextEditingController nameController =
        TextEditingController(text: student.name);
    TextEditingController ageController =
        TextEditingController(text: student.age);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx1) {
        return SizedBox(
          height: 500,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: idController,
                  readOnly: true, // ID is usually not editable
                  decoration: const InputDecoration(labelText: 'ID'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                  onPressed: () {
                    final updatedStudent = StudentModels(
                      id: student.id,
                      name: nameController.text,
                      age: ageController.text,
                    );
          
                    updateStudent(updatedStudent); // Call your update function
                    Navigator.pop(context);
                  },
                  child: const Text('Update'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              
                ]),
              ],
            ),
          ),
        );
      },
    );
  }
}


//or

// import 'package:brocode_tutorial_1/project/hivedBProject/db/db_models/studentModels.dart';
// import 'package:brocode_tutorial_1/project/hivedBProject/db/functions/db_functions.dart';
// import 'package:flutter/material.dart';

// class ListStudentDetails extends StatelessWidget {
//   ListStudentDetails({super.key});

//   TextEditingController idController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: studentListNotifier,
//         builder:
//             (BuildContext ctx, List<StudentModels> studentList, Widget? child) {
//           return ListView.separated(
//             itemBuilder: (ctx, index) {
//               final data = studentList[index];
//               return ListTile(
//                 title: Text(data.name),
//                 subtitle: Text('Age: ${data.age}'),
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.green,
//                   child: Text(data.name[0]),
//                 ),
//                 trailing: SizedBox(
//                   width: 106,
//                   child: Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             if (data.id != null) {
//                               deleteStudent(data.id!);
//                             } else {
//                               print("NO ID Found");
//                             }
//                           },
//                           icon: Icon(Icons.delete)),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                           onPressed: () => updateBottomSheet(context, data),
//                           icon: Icon(Icons.edit)),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (ctx, index) => const Divider(),
//             itemCount: studentList.length,
//           );
//         });
//   }

//   Future<void> updateBottomSheet(
//       BuildContext context, StudentModels student) async {
//     idController.text =student.id?.toString() ?? '';
//     nameController.text = student.name;
//     ageController.text = student.age;

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (ctx1) {
//         return SizedBox(
//           height: 500,
//           child: Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//               left: 20,
//               right: 20,
//               top: 20,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: idController,
//                   readOnly: true, // ID is usually not editable
//                   decoration: const InputDecoration(labelText: 'ID'),
//                 ),
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                 ),
//                 TextField(
//                   controller: ageController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Age'),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       final updatedStudent = StudentModels(
//                         id: student.id,
//                         name: nameController.text,
//                         age: ageController.text,
//                       );

//                       updateStudent(
//                           updatedStudent); // Call your update function
//                       Navigator.pop(context);
//                     },
//                     child: const Text('Update'),
//                   ),
//                   const SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text('Close'),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
