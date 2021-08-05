import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  late String userName;
  late String password;
  late bool isLogin = true; //should be false initially.
  void checkLoginStatus(BuildContext context) {
    //steps to check if LogIn info is correct
    if (isLogin == true) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/navigationPage', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log In'),
            TextField(
              onChanged: (enteredUserName) {
                userName = enteredUserName;
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              onChanged: (enteredPassword) {
                password = enteredPassword;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  checkLoginStatus(context);
                },
                child: Text('Login')),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/makeAccount');
                },
                child: Text(
                  'Don\'t have an account? Sign up here.',
                ))
          ],
        ),
      ),
    );
  }
}
