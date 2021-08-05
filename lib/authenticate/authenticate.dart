import 'package:flutter/material.dart';
import 'log_in.dart';
import 'register.dart';

class Authenticate extends StatefulWidget {

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LogInPage(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView,);
    }
  }
}