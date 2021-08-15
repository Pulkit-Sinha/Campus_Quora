import 'package:flutter/material.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/userAnwer.dart';
import 'package:log_in/shared/loading.dart';

class UserAnswerScreen extends StatefulWidget {
  String useruid;
  UserAnswerScreen({required this.useruid});
  @override
  _UserAnswerScreenState createState() => _UserAnswerScreenState();
}

class _UserAnswerScreenState extends State<UserAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height);
    return StreamBuilder<List<UserAnswers>>(
      stream: DatabaseService(uid: widget.useruid).userAnswersList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserAnswers>? userAnswers = snapshot.data;
          return userAnswers!.length == 0
              ? Scaffold(
                  appBar: AppBar(
                    title: Text('View Answers'),
                  ),
                  body: Container(
                      height: height * 0.9,
                      child: Center(
                        child: Text('No Answers by this user'),
                      )),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text('Answers by a user'),
                  ),
                  body: Container(
                    height: height * 0.9,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Question: ${userAnswers[index].question}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 15,),
                                  Text('Answer: ${userAnswers[index].answer}',style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: userAnswers.length,
                    ),
                  ),
                );
        } else {
          return Loading();
        }
      },
    );
  }
}
