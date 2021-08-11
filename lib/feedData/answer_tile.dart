import 'package:flutter/material.dart';
import 'package:log_in/feedData/answers.dart';

class AnswerTile extends StatelessWidget {
  final Answer answer;
  //final UserProfile userprofile;
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
                ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      'https://qph.fs.quoracdn.net/main-qimg-ab378d740f68914e92f551ecfa3d9457.webp',
                      height: 100,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  title: Text('Answered by ${answer.name}'),
                  subtitle: Text('On ${answer.date.substring(0,10)}'),
                ),
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
