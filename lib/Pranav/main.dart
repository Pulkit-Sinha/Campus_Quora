import 'package:flutter/material.dart';
import 'package:log_in/Pranav/userprofileScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserId(),
  ));
}

class UserId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProfilePage();
  }
}
