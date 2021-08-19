import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/shared/constants.dart';
import 'package:provider/provider.dart';

class AnswerPage extends StatefulWidget {
  Question question;
  AnswerPage({required this.question});

  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final _formKey = GlobalKey<FormState>();
  String answer = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer a question'),
        toolbarHeight: screenheight * (0.095),
      ),
      body: StreamBuilder<UserProfile>(
          stream: DatabaseService(uid: user!.uid).userProfile,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Error');
            }
            UserProfile? userr = snapshot.data;
            return Container(
              height: screenheight * (0.9),
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      '${widget.question.question}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Answer here'),
                            validator: (val) =>
                                val!.isEmpty ? 'Please type something' : null,
                            onChanged: (val) {
                              answer = val;
                            },
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String answername = '';
                                  if (answer.length >= 1000) {
                                    answername = answer.substring(0, 1000);
                                  } else {
                                    answername = answer;
                                  }
                                  answername =
                                      await answername.replaceAll("/", "_");
                                  await DatabaseService(uid: user.uid)
                                      .updateAnswer(
                                    widget.question.question,
                                    answername,
                                    answer,
                                    userr!.firstname,
                                    DateTime.now().toString(),
                                    userr.profilePic,
                                    userr.BitsId,
                                    user.uid,
                                  );
                                  await DatabaseService(uid: user.uid)
                                      .updateUserProfile(
                                          firstname: userr.firstname,
                                          secondname: userr.secondname,
                                          instagramId: userr.instagramId,
                                          aboutMe: userr.aboutMe,
                                          degreeIn: userr.degreeIn,
                                          BitsId: userr.BitsId,
                                          graduationYear: userr.graduationYear,
                                          hostelName: userr.hostelName,
                                          whatsappNumber: userr.whatsappNumber,
                                          profilePic: userr.profilePic,
                                          firstLogin: false,
                                          emailId: userr.emailId,
                                          numberOfPosts:
                                              userr.numberOfPosts + 1);
                                  await DatabaseService(uid: user.uid)
                                      .updateUserAnswers(
                                          widget.question.question,
                                          answer,
                                          answername,
                                          widget.question.questionTag);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Post'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
