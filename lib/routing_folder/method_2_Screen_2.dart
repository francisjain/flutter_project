import 'package:flutter/material.dart';

class MethodTwoRoutTwo extends StatelessWidget {
  final String name;
  final String message;
  const MethodTwoRoutTwo(
      {super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name',
            style: const TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.green,
        elevation: 1.0,
      ),
      body: SafeArea(
          child: Center(
              child: ElevatedButton(
        child: Text('$message'),
        onPressed: () => Navigator.of(context).pop(),
      ))),
    );
  }
}
