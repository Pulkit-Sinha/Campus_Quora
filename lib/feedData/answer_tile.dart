import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/answers.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/shared/loading.dart';
import 'package:provider/provider.dart';

class AnswerTile extends StatefulWidget {
  final Answer answer;
  Question question;

  AnswerTile({required this.answer, required this.question});

  @override
  _AnswerTileState createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {

  alertDialogResult(BuildContext Alertcontext, String answername,
      UserProfile currentUser, Profile user) {
    showDialog(
        context: Alertcontext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete your answer?'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'No');
                  },
                  child: Text('No')),
              ElevatedButton(
                  onPressed: () async {
                    if (widget.answer.answer.length >= 1000) {
                      answername = widget.answer.answer.substring(0, 1000);
                    } else {
                      answername = widget.answer.answer;
                    }
                    answername = await answername.replaceAll("/", "_");
                    await FirebaseFirestore.instance
                        .collection('questions')
                        .doc(widget.question.question)
                        .collection('answers')
                        .doc(answername)
                        .delete();
                    print(user.uid);
                    print(answername);
                    await FirebaseFirestore.instance
                        .collection('userData')
                        .doc(user.uid)
                        .collection('userAnswers')
                        .doc(answername)
                        .delete();
                    await DatabaseService(uid: user.uid).updateUserProfile(
                        firstname: currentUser.firstname,
                        secondname: currentUser.secondname,
                        instagramId: currentUser.instagramId,
                        aboutMe: currentUser.aboutMe,
                        degreeIn: currentUser.degreeIn,
                        BitsId: currentUser.BitsId,
                        graduationYear: currentUser.graduationYear,
                        hostelName: currentUser.hostelName,
                        whatsappNumber: currentUser.whatsappNumber,
                        profilePic: currentUser.profilePic,
                        firstLogin: false,
                        emailId: currentUser.emailId,
                        numberOfPosts: currentUser.numberOfPosts - 1);
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
    String answername = '';
    return StreamBuilder<UserProfile>(
        stream: DatabaseService(uid: user!.uid).userProfile,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }
          UserProfile currentUser = snapshot.data!;
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
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/userProfilePage',
                                arguments: widget.answer.uid);
                          },
                          child: ClipOval(
                            child: Image.network(
                              widget.answer.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        trailing: currentUser.BitsId == widget.answer.BitsId
                            ? IconButton(
                                onPressed: () async {
                                  await alertDialogResult(
                                      context, answername, currentUser, user);

                                  //}
                                },
                                icon: Icon(Icons.delete),
                              )
                            : null,
                        title: Text('Answered by ${widget.answer.name}'),
                        subtitle:
                            Text('On ${widget.answer.date.substring(0, 10)}'),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          //this will contain the answer
                          widget.answer.answer,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
