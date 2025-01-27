import 'package:brocode_tutorial_1/loginSystem/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(Icons.logout),
              color: Colors.white)
        ],
      ),
      body: const SafeArea(child: Center(child: Text('Dashboard Screen'))),
    );
  }
}

signOut(context) async{
  
  final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.clear();

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false);
}
