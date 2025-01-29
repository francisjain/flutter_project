import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final _dropdownItems = [
    {'value': 1, 'title': "Home"},
    {'value': 2, 'title': "Profile"},
    {'value': 3, 'title': "Settings"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: DropdownButtonFormField(
                onChanged: (value) => print(value),
                hint: Text('Select Item'),
                items: _dropdownItems
                    .map((item) => DropdownMenuItem(
                          value: item['value'],
                          child: Text(item['title'].toString()),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
