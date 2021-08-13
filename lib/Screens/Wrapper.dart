import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:log_in/Pranav/HomePage.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';
import 'package:log_in/Vansh/navigationPage.dart';
import 'package:log_in/authenticate/authenticate.dart';
import 'package:log_in/make_account.dart';
import 'package:log_in/shared/loading.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future<bool> FirstLogin(Profile? user) async {
    var instance = FirebaseFirestore.instance;
    CollectionReference categories = instance.collection('userData');
    DocumentSnapshot snapshot = await categories.doc(user!.uid).get();
    var data = snapshot.data() as Map;
    return data['firstLogin'];
  }
  var screen = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Profile?>(context);
    
    if (user == null) {
      return Authenticate();
    } else {
      Future<bool> isFirstLogin = FirstLogin(user);

        isFirstLogin.whenComplete(() {
          setState(() {
            isFirstLogin.then((value) => {
              if(value){
                screen = 1,
              }
              else{
                screen = 2,
            }
            });
          });
        });

      if (screen == 1) {
        return MakeAccount();
      } else if(screen == 2){
        return NavigationPage();
      } else{
        return Loading();
      }


      //return Loading();
    }
  }
}
