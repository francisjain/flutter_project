import 'package:brocode_tutorial_1/listview_folder/home_screen.dart';
import 'package:brocode_tutorial_1/listview_folder/list_view_page.dart';
import 'package:brocode_tutorial_1/loginSystem/splashScreen.dart';
import 'package:brocode_tutorial_1/routing_folder/method_2_screen_1.dart';
import 'package:brocode_tutorial_1/routing_folder/screen_one.dart';
import 'package:brocode_tutorial_1/routing_folder/screen_two.dart';
import 'package:flutter/material.dart';

import 'locSharedPreference/locSharedpreferences.dart';

const SAVE_KEY_NAME = 'USER_LOGGED_IN';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Splashscreen(),
      // routes: {
      //   '/screen_one': (context) => const ScreenOne(),
      //   '/screen_two': (context) => const ScreenTwo(),
      // },
    );
  }
}
