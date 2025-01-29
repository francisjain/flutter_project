import 'package:brocode_tutorial_1/project/hivedBProject/db/db_models/studentModels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'project/hivedBProject/hiveHomepage.dart';

const SAVE_KEY_NAME = 'USER_LOGGED_IN';


Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelsAdapter().typeId)) {
    Hive.registerAdapter(StudentModelsAdapter());
  }
  runApp(const MainApp());
}

// void main() {  
//   runApp(const MainApp());
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home:  HiveHomepage(),
      // routes: {
      //   '/screen_one': (context) => const ScreenOne(),
      //   '/screen_two': (context) => const ScreenTwo(),
      // },
    );
  }
}
