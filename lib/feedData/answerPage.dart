import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/shared/constants.dart';
import 'package:provider/provider.dart';

class AnswerPage extends StatefulWidget {
  String question;
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
      body: Container(
        height: screenheight * (0.9),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Question : ${widget.question}',
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
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Answer here'),
                      validator: (val) =>
                          val!.isEmpty ? 'Please type something' : null,
                      onChanged: (val) {
                        answer = val;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String answername = '';
                            if (answer.length >= 1000) {
                              answername = answer.substring(0, 1000);
                            } else {
                              answername = answer;
                            }
                            answername.replaceAll("/", "_");
                            answer.replaceAll("/", "-");
                            DatabaseService(uid: user!.uid).updateAnswer(
                                widget.question, answername, answer);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Post this answer'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
