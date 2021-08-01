import 'package:flutter/cupertino.dart';

class UserProfile {
  String firstname = 'N.A.';
  String secondname = 'N.A.';
  String emailId = 'N.A.';
  int graduationYear = 2024;
  String degreeIn = 'N.A.';
  String hostelName = 'N.A.';
  String aboutMe = 'N.A.';
  String whatsappNumber = 'N.A.';
  String instagramId = 'N.A.';
  String profilePic = 'profilepicdefault.jpg';
  int numberOfPosts = 0;

  UserProfile({
    required this.firstname,
    required this.secondname,
    required this.instagramId,
    required this.aboutMe,
    required this.degreeIn,
    required this.emailId,
    required this.graduationYear,
    required this.hostelName,
    required this.whatsappNumber,
    required this.profilePic,
  });
}
