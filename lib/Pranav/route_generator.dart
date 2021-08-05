import 'package:flutter/material.dart';
import 'package:log_in/Pranav/HomePage.dart';
import 'package:log_in/Pranav/userprofileScreen.dart';
import 'package:log_in/Vansh/navigationPage.dart';
import 'package:log_in/authenticate/log_in.dart';
import 'package:log_in/make_account.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case '/makeAccount':
        return MaterialPageRoute(builder: (_) => MakeAccount());
      case '/userProfilePage':
        return MaterialPageRoute(builder: (_) => UserProfilePage());
      case '/navigationPage':
        return MaterialPageRoute(builder: (_) => NavigationPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => Text('Error occured'));
    }
  }
}
