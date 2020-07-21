import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //checking if user is signed in
  Stream<String> get onAuthStateChanged => auth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );

  //Getting uid
  Future<String> getCurrentUid() async {
    return (await auth.currentUser()).email;
  }

  Future getCurrentEmail() async {
    return (await auth.currentUser()).email;
  }

  //Get Current user
  Future getCurrentUser() async {
    return await auth.currentUser();
  }

  //sign up with email and password
  Future<String> createUserWithEmailandPassword(
      String email, String password, String name) async {
    final FirebaseUser currentUser = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;  
        print('auth function called');
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      await currentUser.updateProfile(userUpdateInfo);
      await currentUser.reload();
      return currentUser.uid;
  }
    //Email and Password Sign in
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return ((await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
            .user)
        .uid;
  }
    //Sign Out
  signOut() {
    return auth.signOut();
  }

  //Reset password
  Future sendPasswordResetEmail(String email) async {
    return auth.sendPasswordResetEmail(email: email);
  }
}
