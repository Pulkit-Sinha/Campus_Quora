import 'package:flutter/material.dart';
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
  alertdialog(BuildContext context, AuthService auth) {
    var alertDialog = AlertDialog(
      title: Text('Confirm'),
      content: Text('Do you want to Log Out?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
        ),
        ElevatedButton(
            onPressed: () async {
              await auth.signOut();
              Navigator.of(context).pop();
            },
            child: Text('Yes'))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  String filterChosen = '';

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    return StreamProvider<List<Question>?>.value(
      value: DatabaseService(uid: user!.uid).questions,
      initialData: null,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    child: AskQuestion(),
                  );
                });
          },
          child: FittedBox(
            fit: BoxFit.cover,
            child: Row(
              children: [
                Icon(Icons.add,
                size: 40,
                color: Colors.white,),
                /*Text('Add Ques')*/
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(title: Container(
          width: 190,
            child: Text('Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.end,),
        ),
            actions: [
          /*TextButton(
            onPressed: () {
              alertdialog(context, _auth);
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
          )*/
          Column(
            children: [
              DropdownButton(
                iconSize: 35,
                style: const TextStyle(color: Colors.purple),
                underline: Container(
                  color: Colors.deepPurpleAccent,
                ),
                /*hint: Text(
                  filterChosen,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),*/
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != 'Remove Filter') {
                      filterChosen = newValue!;
                    } else {
                      filterChosen = '';
                    }
                  });
                },
                items: [
                  'Food',
                  'Admission',
                  'Culture',
                  'General',
                  'Academics',
                  'Remove Filter',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                icon: (filterChosen == '')? Icon(Icons.filter_alt): Icon(Icons.filter_alt, color: Colors.yellow,),
              ),
            ],
          ),
        ]),
        //body will contain the list of questions ..on tapping each question user can see the option to answer the question and see the previous replies.

        body: QuestionList(filterChosen),
      ),
    );
  }
}
