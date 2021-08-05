import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:log_in/Pranav/data/profile.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');

  Future updateUserProfile(
      String firstname,
      String secondname,
      String instagramId,
      String aboutMe,
      String degreeIn,
      String BitsId,
      String graduationYear,
      String hostelName,
      String whatsappNumber,
      String profilePic) async {
    return await userDataCollection.doc(uid).set({
      'firstname': firstname,
       'secondname' : secondname,
       'instagramId' :instagramId,
       'aboutMe': aboutMe,
       'degreeIn': degreeIn,
        'BitsId' : BitsId,
        'graduationYear': graduationYear,
        'hostelName': hostelName,
        'whatsappNumber': whatsappNumber,
        'profilePic' :profilePic
    });
  }

  UserProfile _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile(
        firstname: snapshot.get('firstname'),
        secondname: snapshot.get('secondname'),
        instagramId: snapshot.get('instagramId'),
        aboutMe: snapshot.get('aboutMe'),
        degreeIn: snapshot.get('degreeIn'),
        BitsId: snapshot.get('BitsId'),
        graduationYear: snapshot.get('graduationYear'),
        hostelName: snapshot.get('hostelName'),
        whatsappNumber: snapshot.get('whatsappNumber'),
        profilePic: snapshot.get('profilePic'));
  }

  Stream<UserProfile>? get userProfile {
    return userDataCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
