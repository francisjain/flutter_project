import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 14.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    iconColor: Colors.white),
                onPressed: () => loginSubmit(context),
                icon: const Icon(Icons.login),
                label: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ))
          ]),
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
    }
  }
}
