import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/auth.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/feedData/askquestion.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/feedData/questionList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    return StreamProvider<List<Question>?>.value(
      value: DatabaseService(uid: user!.uid).questions,
      initialData: null,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                    child:AskQuestion(),
                  );
                });
          },
          child: FittedBox(
            fit: BoxFit.cover,
            child: Row(
              children: [
                // Icon(Icons.add,),
                Text('Add Ques')
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(title: Text('Home Page'), actions: [
          TextButton(
            onPressed: () {
              _auth.signOut();
            },
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ]),
        //body will contain the list of questions ..on tapping each question user can see the option to answer the question and see the previous replies.
    
        body: QuestionList(),
      ),
    );
  }
}
