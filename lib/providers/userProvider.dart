

import 'package:flutter/material.dart';
import 'package:moyin_challenge/models/user.dart';
import 'package:moyin_challenge/services/authService.dart';
import 'package:moyin_challenge/services/firebaseservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User user;
  var errorMessage;
  bool loading = false;
  bool isLoggedin = false;

  
 
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
  getUserName(username) async {
    username = await AuthService().getCurrentName();
    notifyListeners();
    return username;
    
  }
  signin(email,password) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try{
      print('method was called');
      await AuthService().signInWithEmailAndPassword(email, password).then((value) {
        setLoading(true);
        setIsloggedIn(true);
        prefs.setString('email', email);
        prefs.setBool('isLoggedin', isLoggedin);
        print(isLoggedin.toString());
        setMessage('successful');
      });
    }catch(e){
      setMessage(e.message);
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

  void setIsloggedIn(value){
    isLoggedin = value;
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