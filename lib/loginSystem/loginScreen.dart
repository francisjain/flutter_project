import 'package:brocode_tutorial_1/loginSystem/dashboardScreen.dart';
import 'package:brocode_tutorial_1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatch = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'username is required';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: _isDataMatch,
                      child: Text("Invalid username or password",
                          style: TextStyle(color: Colors.blue.shade900))),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 14.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          iconColor: Colors.white),
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {loginSubmit(context)}
                            else
                              {
                                setState(() {
                                  _isDataMatch = true;
                                })
                              }
                          },
                      icon: const Icon(Icons.login),
                      label: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  void loginSubmit(BuildContext context) async{
    String username = _usernameController.text;
    String password = _passwordController.text;
    print('Username: $username, Password: $password');
    if (username == password) {
      final _sharedPref = await SharedPreferences.getInstance();
      await _sharedPref.setBool(SAVE_KEY_NAME, true);

      
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const DashboardScreen()));
    } else {
      //snakbar
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Success'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        closeIconColor: Colors.white,
        margin: EdgeInsets.all(20.0),
        duration: Duration(seconds: 4),
        showCloseIcon: true,
      ));

      //aleart
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Login Success'),
                content: const Text('you are logged in'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('Close')),
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Logout'),
                  )
                ],
              ));

      //snow text

      setState(() {
        _isDataMatch = true;
      });

      Future.delayed(const Duration(seconds: 4)).then((_) {
        setState(() {
          _isDataMatch = false;
        });
      });
    }
  }
}
