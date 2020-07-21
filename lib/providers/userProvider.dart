

import 'package:flutter/material.dart';
import 'package:moyin_challenge/models/user.dart';
import 'package:moyin_challenge/services/authService.dart';
import 'package:moyin_challenge/services/firebaseservice.dart';

class UserProvider with ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  addUser(name, email, password) async {
    await AuthService()
        .createUserWithEmailandPassword(email, password, name).then(( data){
          if(data!= null){
            setLoading(true);
           FirebaseService.addUser(name, email);
           setMessage('successful');
          }else{
            setMessage(data);
          }
  setLoading(false);
  notifyListeners();
        });
        
    // await FirebaseService.addUser(name,email).then((data){
    //   setLoading(false);
    //   if(data.status == 200){
    //   // setUser(User.fromJson(json.decode(data.body)));
    //   setMessage('Succesful');
    //   }else{
    //     Map<String,dynamic> result = json.decode(data.body);
    //     setMessage(result['status']);
    //   }
    // });
    // return user != null? true:false;
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
