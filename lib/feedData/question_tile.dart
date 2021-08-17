import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:log_in/feedData/question.dart';

class QuestionTile extends StatelessWidget {
  final Question question;
  final String filterChosen;
  QuestionTile({required this.question, required this.filterChosen});
  Question? filteredQuestion;

  @override
  Widget build(BuildContext context) {
    if (filterChosen == '') {
      filteredQuestion = question;
    } else if (question.questionTag == filterChosen) {
      filteredQuestion = question;
    } else {
      return Card();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    //this will contain the question
                    filteredQuestion!.question,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    //this will contain the question tag
                    filteredQuestion!.questionTag,
                    style: TextStyle(fontSize: 10, color: Colors.purple),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.pencilAlt,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/answerPage', arguments: question);
                      },
                      label: Text(
                        'Answer',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.list,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/answerList', arguments: question);
                      },
                      label: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'View Previous Answers',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
