import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/shared/constants.dart';
import 'package:provider/provider.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question = '';
  String questionTag = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    return 
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ask a Question',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Type Your Question here!',
                      
                  ),
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter a question here' : null,
                  onChanged: (val) {
                    question = val;
                  }, // this must add question in database..to be completed.
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                  // value: [],
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  isExpanded: true,
                  elevation: 16,
                  style: const TextStyle(color: Colors.purple),
                  validator: (val) =>
                      val == null ? "Please mention type of question" : null,
                  hint: Text("Category"),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  onChanged: (Object? newValue) {
                    setState(() {
                      questionTag = newValue!.toString();
                      //degreeIn = newValue;
                    });
                  },
                  items: ['Food', 'Admission', 'Culture', 'General', 'Academics','Miscellaneous']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        DatabaseService(uid: user!.uid)
                            .updateQuestion(question, questionTag,user.uid);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Ask Question'))
              ],
            ),
          ),
        );
  }
}
