import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moyin_challenge/services/authService.dart';

class FirebaseService {
  static addUser(_name, _email) async {
    final db = Firestore.instance;

    final uEmail = await AuthService().getCurrentEmail();

    var userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = _name;
  print('firebase fucntion was called');
    await db
        .collection('userData')
        .document(uEmail)
        .setData({'name': _name, 'email': _email}).catchError((e){
          print(e);
        });
    print('service was succesful');
  }
}
