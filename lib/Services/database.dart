import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/feedData/question.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');
  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection('questions');

  Future updateUserProfile(
      {required String firstname,
      required String secondname,
      required String instagramId,
      required String aboutMe,
      required String degreeIn,
      required String BitsId,
      required String graduationYear,
      required String hostelName,
      required String whatsappNumber,
      required String profilePic,
      required bool firstLogin,
      required String emailId,
      required int numberOfPosts}) async {
    return await userDataCollection.doc(uid).set({
      'firstname': firstname,
      'secondname': secondname,
      'BitsId': BitsId,
      'graduationYear': graduationYear,
      'degreeIn': degreeIn,
      'hostelName': hostelName,
      'aboutMe': aboutMe,
      'whatsappNumber': whatsappNumber,
      'instagramId': instagramId,
      'profilePic': profilePic,
      'numberOfPosts': numberOfPosts,
      'firstLogin': firstLogin,
      'emailId': emailId,
    });
  }

  Future updateQuestion(String question) async {
    return await questionCollection.doc(question).set({
      'question': question,
    });
  }

  UserProfile userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile(
        firstname: snapshot.get('firstname'),
        secondname: snapshot.get('secondname'),
        BitsId: snapshot.get('BitsId'),
        graduationYear: snapshot.get('graduationYear'),
        degreeIn: snapshot.get('degreeIn'),
        hostelName: snapshot.get('hostelName'),
        aboutMe: snapshot.get('aboutMe'),
        whatsappNumber: snapshot.get('whatsappNumber'),
        instagramId: snapshot.get('instagramId'),
        profilePic: snapshot.get('profilePic'),
        emailId: snapshot.get('emailId'));
  }

  Stream<UserProfile> get userProfile {
    return userDataCollection.doc(uid).snapshots().map(userDataFromSnapshot);
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Question(question: e.get('question') ?? "");
    }).toList();
  }

  Stream<List<Question>> get questions {
    return questionCollection.snapshots().map(_questionListFromSnapshot);
  }
}
