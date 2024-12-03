import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _textController = TextEditingController();

  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[200]),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _searchTerm = _textController.text;
                      });
                    },
                    child: Text('Search')),
                SizedBox(
                  height: 10,
                ),
                Text('Search Term: $_searchTerm'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
