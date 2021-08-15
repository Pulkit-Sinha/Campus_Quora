import 'package:firebase_auth/firebase_auth.dart';

class UserAnswers {
  String question;
  String answer;
  String questionTag;
  UserAnswers(
      {required this.question,
      required this.answer,
      required this.questionTag});
}
