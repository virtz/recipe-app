

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moyin_challenge/models/user.dart';
import 'package:moyin_challenge/services/authService.dart';
import 'package:moyin_challenge/services/firebaseservice.dart';

class UserProvider with ChangeNotifier {
  User user;
  var errorMessage;
  bool loading = false;

  addUser(name, email, password) async {
    try{
      await AuthService()
        .createUserWithEmailandPassword(email, password, name).then(( data){
         
            setLoading(true);
           FirebaseService.addUser(name, email);
           setMessage('successful');
         
  setLoading(false);
  notifyListeners();
        });
    } catch(e) {
      // throw Failure("Couldn't sign up, an error occured");
      setMessage(e.message);
      // print(e);
      setLoading(false);
    }
        
   
  }

  bool isLoading() {
    return loading;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }
}


class Failure{
  final String message;

  Failure(this.message);
  @override
  String toString()=> message;

}