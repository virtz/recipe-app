import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:moyin_challenge/pages/nextPage.dart';
import 'package:moyin_challenge/pages/signup.dart';
import 'package:moyin_challenge/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  String error;
  bool autoValidate = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    return Scaffold(
        backgroundColor: Color(0xFFF9FDFF),
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil().setHeight(60)),
                      Text('Welcome,',
                          style: TextStyle(
                              color: Color(0xFF2A3A64),
                              fontSize: ScreenUtil().setSp(22),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: ScreenUtil().setHeight(7)),
                      Text(
                        'Login to continue ',
                        style: TextStyle(
                          color: Color(0xFF2A3A64),
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      Form(
                          autovalidate: autoValidate,
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                // controller: _controller,
                                autocorrect: true,
                                onSaved: (val) => email = val,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Incorrect email format';
                                  }
                                  return null;
                                },
                                style:
                                    TextStyle(fontSize: ScreenUtil().setSp(13)),
                                keyboardType: TextInputType.emailAddress,
                                enabled: !userProvider.isLoading(),
                                decoration: InputDecoration(
                                  fillColor: Color(0xFFFFFFFFF),
                                  //  errorText: userProvider.getMessage(),
                                  filled: true,
                                   enabled: !userProvider.isLoading(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  hintText: 'Email e.g irene@gmail.com',
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(11)),
                                  // border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                        color: Color(0xFFD8D8DF), width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                        color: Color(0xFFD8D8DF), width: 1),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                          color: Color(0xFFD8D8DF), width: 1)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Container(
                                        child: SvgPicture.asset(
                                            'assets/images/mail.svg')),
                                  ),
                                  prefixIconConstraints:
                                      BoxConstraints(maxHeight: 20.0),

                                  // prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              TextFormField(
                                // controller: _controller,
                                autocorrect: true,
                                obscureText: obscureText,
                                onSaved: (val) => password = val,
                                validator: (value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                                style:
                                    TextStyle(fontSize: ScreenUtil().setSp(13)),
                                keyboardType: TextInputType.text,
                                enabled: !userProvider.isLoading(),
                                decoration: InputDecoration(
                                  fillColor: Color(0xFFFFFFFFF),
                                  //  errorText: userProvider.getMessage(),
                                  filled: true,
                                  // errorText: email == null?'value cannot be empty':email,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(11)),
                                  // border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                        color: Color(0xFFD8D8DF), width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                        color: Color(0xFFD8D8DF), width: 1),
                                  ),

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                          color: Color(0xFFD8D8DF), width: 1)),

                                  suffix: GestureDetector(
                                      onTap: _toggle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          obscureText ? "Show" : "Hide",
                                        ),
                                      )),

                                  suffixIconConstraints:
                                      BoxConstraints(minHeight: 10.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Container(
                                        child: SvgPicture.asset(
                                            'assets/images/lock.svg')),
                                  ),
                                  prefixIconConstraints:
                                      BoxConstraints(maxHeight: 20.0),

                                  // prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text("Forgot Password ?",
                                      style: TextStyle(
                                        color: Color(0xFF7B8295),
                                        fontSize: ScreenUtil().setSp(11),
                                      ))),
                              SizedBox(height: ScreenUtil().setHeight(55)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: MaterialButton(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    height: ScreenUtil().setHeight(50),
                                    onPressed: _submit,
                                    color: Color(0xFF257ED9),
                                    child: Center(
                                        child:
                                             userProvider.isLoading()
                                                ? CircularProgressIndicator(
                                                    backgroundColor: Colors.white, strokeWidth: 2):
                                            Text('Login',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: ScreenUtil()
                                                        .setSp(14))))),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(20)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignUp()));
                                },
                                child: RichText(
                                    text: TextSpan(
                                        text: "Don't have an account ?",
                                        style:
                                            TextStyle(color: Color(0xFF687593)),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: 'SignUp',
                                          style: TextStyle(fontSize: 15))
                                    ])),
                              )
                            ],
                          ))
                    ]);
              },
            )));
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  _submit() async{
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final form = formKey.currentState;
    if (form.validate()) {
        form.save();
        print('fucntion was called');
      userProvider.setLoading(true);
     await userProvider.signin(email, password).
     catchError((e) {
        setState(() {
          error = e.message;
        });
      });
      if (userProvider.errorMessage != null &&
          userProvider.errorMessage != 'successful') {
        _showCupertinoDialog(context);
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => NextPage()));
      }
        //  _showCupertinoDialog(context);
    
    } else {
      print('form didnt validate');
         setState(() {
      autoValidate = true;
    });
    }
 
  }



_showCupertinoDialog(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CupertinoAlertDialog(
            title: new Text(
              "Error",
              style: TextStyle(color: Colors.red),
            ),
            content: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(userProvider.errorMessage),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
}