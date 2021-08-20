import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/feedData/answers.dart';
import 'package:log_in/feedData/question.dart';
import 'package:log_in/feedData/userAnwer.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');
  final CollectionReference questionCollection =
      FirebaseFirestore.instance.collection('questions');
  final CollectionReference answersCollection =
      FirebaseFirestore.instance.collection('answers');
  final CollectionReference userAnswerCollection =
      FirebaseFirestore.instance.collection('userAnswers');

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

  Future updateQuestion(
      String question, String questionTag, String uid) async {
    return await questionCollection.doc(question).set({
      'question': question,
      'questionTag': questionTag,
      'uid': uid,
    });
  }

  Future updateUserAnswers(String question, String answer, String answername,
      String questionTag) async {
    return await userDataCollection
        .doc(uid)
        .collection('userAnswers')
        .doc(answername)
        .set({
      'question': question,
      'questionTag': questionTag,
      'answer': answer,
    });
  }

  Future updateAnswer(String question, String answername, String answer,
      String name, String date, String image, String BitsId, String uid) async {
    return await questionCollection
        .doc(question)
        .collection('answers')
        .doc(answername)
        .set({
      'answer': answer,
      'name': name,
      'date': date,
      'image': image,
      'BitsId': BitsId,
      'uid': uid,
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
        numberOfPosts: snapshot.get('numberOfPosts'),
        emailId: snapshot.get('emailId'));
  }

  Stream<UserProfile> get userProfile {
    return userDataCollection.doc(uid).snapshots().map(userDataFromSnapshot);
  }

  List<Question> _questionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Question(
          question: e.get('question') ?? "",
          questionTag: e.get('questionTag') ?? "",
          uid: e.get('uid') ?? "");
    }).toList();
  }

  Stream<List<Question>> get questions {
    return questionCollection.snapshots().map(_questionListFromSnapshot);
  }

  List<Answer> _answerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return Answer(
          answer: e.get('answer') ?? "",
          name: e.get('name') ?? "",
          date: e.get('date') ?? "",
          image: e.get('image'),
          BitsId: e.get('BitsId'),
          uid: e.get('uid'));
    }).toList();
  }

  Stream<List<Answer>> getAnswers(String question) {
    return questionCollection
        .doc(question)
        .collection('answers')
        .snapshots()
        .map(_answerListFromSnapshot);
  }

  List<UserAnswers> _userAnswerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return UserAnswers(
          question: e.get('question'),
          answer: e.get('answer'),
          questionTag: e.get('questionTag'));
    }).toList();
  }

  Stream<List<UserAnswers>> get userAnswersList {
    return userDataCollection
        .doc(uid)
        .collection('userAnswers')
        .snapshots()
        .map(_userAnswerListFromSnapshot);
  }
}
