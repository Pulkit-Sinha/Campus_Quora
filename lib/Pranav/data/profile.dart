class Profile {
  String uid;
  Profile({required this.uid});
}

class UserProfile {
  String firstname = 'N.A.';
  String secondname = 'N.A.';
  String BitsId = 'N.A.';
  String graduationYear = '2024';
  String degreeIn = 'N.A.';
  String hostelName = 'N.A.';
  String aboutMe = 'N.A.';
  String whatsappNumber = 'N.A.';
  String instagramId = 'N.A.';
  String profilePic = 'profilepicdefault.jpg';
  int numberOfPosts = 0;
  bool firstTimeLogIn = true;

  UserProfile({
    required this.firstname,
    required this.secondname,
    required this.instagramId,
    required this.aboutMe,
    required this.degreeIn,
    required this.BitsId,
    required this.graduationYear,
    required this.hostelName,
    required this.whatsappNumber,
    required this.profilePic,
  });
}
