import 'package:brocode_tutorial_1/routing_folder/method_2_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockPage extends StatelessWidget {
  LockPage({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getDataFromStorage(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
              ),
              ElevatedButton(
                  onPressed: saveDataToStorage,
                  child: const Text('Save password'))
            ],
          ),
        ),
      )),
    );
  }

  Future<void> saveDataToStorage() async {
    final sharePrefer = await SharedPreferences.getInstance();
    print(_textController.text);
    await sharePrefer.setString('password', _textController.text);
  }

  Future<void> getDataFromStorage(BuildContext context) async {
    final sharePrefer = await SharedPreferences.getInstance();
    final password = sharePrefer.getString('password');
    if (password != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const MethodTwoRoutOne()));
    }
  }
}
