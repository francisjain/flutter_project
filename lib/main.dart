import 'package:brocode_tutorial_1/listview_folder/home_screen.dart';
import 'package:brocode_tutorial_1/listview_folder/list_view_page.dart';
import 'package:brocode_tutorial_1/routing_folder/method_2_screen_1.dart';
import 'package:brocode_tutorial_1/routing_folder/screen_one.dart';
import 'package:brocode_tutorial_1/routing_folder/screen_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MethodTwoRoutOne(),
      // routes: {
      //   '/screen_one': (context) => const ScreenOne(),
      //   '/screen_two': (context) => const ScreenTwo(),
      // },
    );
  }
}
