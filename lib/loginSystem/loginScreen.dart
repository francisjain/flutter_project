import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

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
                      child: Text("Login success",
                          style: TextStyle(color: Colors.green)),
                      visible: _isDataMatch),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 14.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          iconColor: Colors.white),
                      onPressed: () => {
                            _formKey.currentState!.validate(),
                            loginSubmit(context)
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

  void loginSubmit(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;
    print('Username: $username, Password: $password');
    if (username == password) {
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
                title: Text('Login Success'),
                content: Text('you are logged in'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text('Close')),
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text('Logout'),
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
