import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:log_in/Pranav/data/profile.dart';
import 'package:log_in/Services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create profile object based on User
  Profile? _userFromFirebaseUser(User user) {
    return Profile(uid: user.uid);
  }

  //auth change user stream
  Stream<Profile?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in from email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register from email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserProfile(
          firstname: 'N.A.',
          secondname: 'N.A.',
          BitsId: 'N.A.',
          graduationYear: 'N.A.',
          degreeIn: 'N.A.',
          hostelName: 'N.A.',
          aboutMe:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec ante magna. Duis accumsan turpis a diam facilisis, non accumsan ligula consectetur. Suspendisse lacinia aliquet neque sed tempor. Vestibulum sit amet nunc ac urna tincidunt vestibulum in non felis. Nulla facilisi. Nam feugiat facilisis dolor, sit amet congue est rutrum sit amet.',
          whatsappNumber: 'N.A.',
          instagramId: 'N.A.',
          profilePic: 'N.A.',
          numberOfPosts: 0,
          firstLogin: true,
          emailId: 'N.A.');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      try {
        await googleSignIn.disconnect();
      } catch (e) {
        print(e.toString());
      }
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //google sign in user
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get userr => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;

      if (result.additionalUserInfo!.isNewUser) {
        await DatabaseService(uid: user!.uid).updateUserProfile(
            firstname: 'N.A.',
            secondname: 'N.A.',
            BitsId: 'N.A.',
            graduationYear: 'N.A.',
            degreeIn: 'N.A.',
            hostelName: 'N.A.',
            aboutMe:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec ante magna. Duis accumsan turpis a diam facilisis, non accumsan ligula consectetur. Suspendisse lacinia aliquet neque sed tempor. Vestibulum sit amet nunc ac urna tincidunt vestibulum in non felis. Nulla facilisi. Nam feugiat facilisis dolor, sit amet congue est rutrum sit amet.',
            whatsappNumber: 'N.A.',
            instagramId: 'N.A.',
            profilePic: 'N.A.',
            numberOfPosts: 0,
            firstLogin: true,
            emailId: 'N.A.');
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
