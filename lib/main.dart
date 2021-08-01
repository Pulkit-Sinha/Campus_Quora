import 'package:flutter/material.dart';
import 'package:log_in/Pranav/userprofileScreen.dart';
import 'package:log_in/Vansh/homePage.dart';
import 'package:log_in/log_in.dart';
import 'package:log_in/make_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>LogInPage(),
        '/makeAccount':(context)=>MakeAccount(),
        '/userProfilePage':(context)=>UserProfilePage(),
        '/homePage':(context)=>HomePage(),
      },
    );
  }
}
