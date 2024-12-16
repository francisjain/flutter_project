import 'package:brocode_tutorial_1/loginSystem/loginScreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    _navigateToNextScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Capture.PNG'),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }
}
