import 'package:flutter/material.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/feedData/question_tile.dart';
import 'package:provider/provider.dart';

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>?>(context) ?? [];
    return ListView.builder(itemBuilder: (context, index) {
      return QuestionTile(question: questions[index]);
    },
    itemCount: questions.length,);
  }
}
