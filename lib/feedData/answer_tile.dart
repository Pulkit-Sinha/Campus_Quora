import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/answers.dart';
import 'package:log_in/shared/loading.dart';
import 'package:provider/provider.dart';

class AnswerTile extends StatelessWidget {
  final Answer answer;
  String question;
  //final UserProfile userprofile;
  AnswerTile({required this.answer, required this.question});

  alertDialogResult(BuildContext context, String answername,
      UserProfile currentUser, Profile user) {
    var alertDialog = AlertDialog(
      title: Text('Confirm Delete'),
      content: Text('Do you want to delete this answer?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
        ElevatedButton(
            onPressed: () async {
              if (answer.answer.length >= 1000) {
                answername = answer.answer.substring(0, 1000);
              } else {
                answername = answer.answer;
              }
              answername = await answername.replaceAll("/", "_");
              await FirebaseFirestore.instance
                  .collection('questions')
                  .doc(question)
                  .collection('answers')
                  .doc(answername)
                  .delete();
                  Navigator.of(context).pop();
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

              
            },
            child: Text('Yes')),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
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
                        leading: ClipOval(
                          child: Image.network(
                            'https://qph.fs.quoracdn.net/main-qimg-ab378d740f68914e92f551ecfa3d9457.webp',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        trailing: currentUser.BitsId == answer.BitsId
                            ? IconButton(
                                onPressed: () async {
                                  await alertDialogResult(
                                      context, answername, currentUser, user);
                                },
                                icon: Icon(Icons.delete),
                              )
                            : null,
                        title: Text('Answered by ${answer.name}'),
                        subtitle: Text('On ${answer.date.substring(0, 10)}'),
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
        });
  }
}
