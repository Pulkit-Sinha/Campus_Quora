import 'package:flutter/material.dart';
import 'package:log_in/feedData/answers.dart';


class AnswerTile extends StatelessWidget {
  final Answer answer;
  AnswerTile({required this.answer});

  @override
  Widget build(BuildContext context) {
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
                    //this will contain the answer
                    answer.answer,
                    style: TextStyle(fontSize: 18),
                  ),
                ),      
              ],
            ),
          ),
        ),
      ],
    );
  }
}
