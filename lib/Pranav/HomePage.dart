import 'package:flutter/material.dart';
import 'package:log_in/Services/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page'), actions: [
      TextButton(
        onPressed: () {
          _auth.signOut();
        },
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.black,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ]));
  }
}
