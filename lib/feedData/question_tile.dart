import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/question.dart';
import 'package:provider/provider.dart';

class QuestionTile extends StatefulWidget {
  final Question question;
  final String filterChosen;
  QuestionTile({required this.question, required this.filterChosen});

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  _deleteDatafromsnapshot(QuerySnapshot snapshot) {
    //print(snapshot);
    snapshot.docs.map((e) async {
      print(e.data());
    });
  }

  Question? filteredQuestion;
  alertDialogResult(BuildContext Alertcontext, Profile user, String question) {
    showDialog(
        context: Alertcontext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text(
                'Are you sure you want to delete this question? All the answers posted will also be deleted.'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'No');
                  },
                  child: Text('No')),
              ElevatedButton(
                  onPressed: () async {
                    //print(question);

                    // await FirebaseFirestore.instance
                    //     .collection('questions')
                    //     .doc(question)
                    //     .collection('answers')
                    //     .snapshots()
                    //     .map(_deleteDatafromsnapshot);

                    var collection = FirebaseFirestore.instance
                        .collection('questions')
                        .doc(question)
                        .collection('answers');
                    var snapshots = await collection.get();
                    for (var e in snapshots.docs) {
                      String answername;
                      if (e.get('answer').length >= 1000) {
                        answername = e.get('answer').substring(0, 1000);
                      } else {
                        answername = e.get('answer');
                      }
                      answername = await answername.replaceAll("/", "_");
                      print(answername);
                      await FirebaseFirestore.instance
                          .collection('userData')
                          .doc(e.get('uid'))
                          .collection('userAnswers')
                          .doc(answername)
                          .delete();
                      int initialPosts = 1;
                      await FirebaseFirestore.instance
                          .collection('userData')
                          .doc(e.get('uid'))
                          .get()
                          .then((value) {
                        initialPosts = value.data()!['numberOfPosts'];
                        print(initialPosts);
                      });
                      await FirebaseFirestore.instance
                          .collection('userData')
                          .doc(e.get('uid'))
                          .update({'numberOfPosts': initialPosts - 1});
                      await e.reference.delete();
                    }
                    try {
                      await FirebaseFirestore.instance
                          .collection('questions')
                          .doc(question)
                          .delete();
                    } catch (e) {
                      print(e.toString());
                    }
                    Navigator.pop(context, 'Yes');
                  },
                  child: Text('Yes')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    if (widget.filterChosen == '') {
      filteredQuestion = widget.question;
    } else if (widget.question.questionTag == widget.filterChosen) {
      filteredQuestion = widget.question;
    } else {
      return Container(
        height: 0,
      );
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
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        //this will contain the question tag
                        filteredQuestion!.questionTag,
                        style: TextStyle(fontSize: 16, color: Colors.yellow),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: user!.uid == widget.question.uid
                          ? IconButton(
                              onPressed: () async {
                                await alertDialogResult(
                                    context, user, filteredQuestion!.question);
                              },
                              icon: Icon(Icons.delete))
                          : null,
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.pencilAlt,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/answerPage',
                            arguments: widget.question);
                      },
                      label: Text(
                        'Answer',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple, elevation: 0),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.list,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/answerList',
                            arguments: widget.question);
                      },
                      label: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'View Previous Answers',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple, elevation: 0),
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
