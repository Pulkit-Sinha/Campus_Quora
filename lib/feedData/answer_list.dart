import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/answer_tile.dart';
import 'package:log_in/feedData/answers.dart';
import 'package:log_in/shared/loading.dart';
import 'package:provider/provider.dart';

class AnswerList extends StatefulWidget {
  String question;
  AnswerList({required this.question});
  @override
  _AnswerListState createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height);
    final user = Provider.of<Profile?>(context);
    //final answers = DatabaseService(uid: user!.uid).getAnswers(widget.question);
    return StreamBuilder<List<Answer>>(
        stream: DatabaseService(uid: user!.uid).getAnswers(widget.question),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Answer>? answers = snapshot.data;
            //print(answers!.length);
            return answers!.length == 0
                ? Scaffold(
                    appBar: AppBar(
                      title: Text('View Answers'),
                    ),
                    body: Container(
                      height: height * 0.9,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            widget.question,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text('This question is not yet answered'),
                        )
                      ]),
                    ),
                  )
                : Scaffold(
                    appBar: AppBar(
                      title: Text('View Answers'),
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        height: height * (0.9),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                widget.question,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: height * (0.7),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return AnswerTile(answer: answers[index]);
                                },
                                itemCount: answers.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          } else {
            return Loading();
          }
        });
  }
}
