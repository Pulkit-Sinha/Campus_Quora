import 'package:flutter/material.dart';
import 'package:log_in/Pranav/HomePage.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Pranav/userAnswersScreen.dart';
import 'package:log_in/Pranav/userprofileScreen.dart';
import 'package:log_in/Vansh/navigationPage.dart';
import 'package:log_in/feedData/answerPage.dart';
import 'package:log_in/feedData/answer_list.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/make_account.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/makeAccount':
        return MaterialPageRoute(builder: (_) => MakeAccount());
      case '/userProfilePage':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => UserProfilePage(
                    useruid: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => Text('Error occured'));
      case '/navigationPage':
        return MaterialPageRoute(builder: (_) => NavigationPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/answerPage':
        if (args is Question) {
          return MaterialPageRoute(builder: (_) => AnswerPage(question: args));
        }
        return MaterialPageRoute(builder: (_) => Text('Error occured'));
      case '/answerList':
        if (args is Question) {
          return MaterialPageRoute(builder: (_) => AnswerList(question: args));
        }
        return MaterialPageRoute(builder: (_) => Text('Error occured'));

      case '/userAnswerList':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => UserAnswerScreen(useruid: args));
        }
        return MaterialPageRoute(builder: (_) => Text('Error occured'));
      default:
        return MaterialPageRoute(builder: (_) => Text('Error occured'));
    }
  }
}
