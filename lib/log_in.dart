import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){}, child: Text('Login')),
            SizedBox(height: 50,),
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
