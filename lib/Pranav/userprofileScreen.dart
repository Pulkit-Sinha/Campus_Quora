import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:log_in/Services/database.dart';
import 'package:provider/provider.dart';
import 'data/profile.dart';

class UserProfilePage extends StatefulWidget {
  String useruid;
  UserProfilePage({required this.useruid});
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  editInformation(String nameOfFieldtoBeChanged, String newValue) {
    FirebaseFirestore.instance
        .collection('userData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({nameOfFieldtoBeChanged: newValue});
  }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;

    return StreamBuilder<UserProfile>(
        stream: DatabaseService(uid: widget.useruid).userProfile,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Error');
          }
          UserProfile currentUser = snapshot.data!;
          return Scaffold(
              backgroundColor: Colors.grey[900],
              appBar: AppBar(
                title: Text('User Profile'),
                centerTitle: true,
                backgroundColor: Colors.grey[850],
              ),
              body: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 30, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.network(
                          currentUser.profilePic,
                          height: 110,
                          width: 110,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightOfScreen / 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[800]),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/userAnswerList',
                                      arguments: widget.useruid);
                                },
                                child: Text(
                                  'Posts: ${currentUser.numberOfPosts}',
                                  style: TextStyle(
                                      color: Colors.amberAccent, fontSize: 18),
                                )),
                            width: double.infinity,
                          ),
                          Divider(
                            height: 60,
                            color: Colors.grey[800],
                          ),
                          Container(
                            height: heightOfScreen * (0.4),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NAME',
                                    style: TextStyle(
                                        color: Colors.grey, letterSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    ('${currentUser.firstname} ${currentUser.secondname}'),
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      letterSpacing: 2.0,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(height: heightOfScreen / 50),
                                  Text(
                                    'Graduation Year',
                                    style: TextStyle(
                                        color: Colors.grey, letterSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    '${currentUser.graduationYear}',
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      letterSpacing: 2.0,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    'Degree',
                                    style: TextStyle(
                                        color: Colors.grey, letterSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    '${currentUser.degreeIn}',
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      letterSpacing: 2.0,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    'Hostel',
                                    style: TextStyle(
                                        color: Colors.grey, letterSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    '${currentUser.hostelName}',
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      letterSpacing: 2.0,
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    'About Me',
                                    style: TextStyle(
                                        color: Colors.grey, letterSpacing: 2.0),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Text(
                                    '${currentUser.aboutMe}',
                                    style: TextStyle(
                                      color: Colors.amberAccent,
                                      letterSpacing: 2.0,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  ),
                                  Divider(
                                    height: 60,
                                    color: Colors.grey[800],
                                  ),
                                  Center(
                                    child: Text(
                                      'Contact',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          letterSpacing: 2.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: heightOfScreen / 50,
                                      ),
                                      Text(
                                        currentUser.emailId,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 18,
                                          letterSpacing: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 100,
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: heightOfScreen / 50,
                                      ),
                                      Text(
                                        currentUser.whatsappNumber,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 18,
                                          letterSpacing: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightOfScreen / 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
