import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moyin_challenge/pages/login.dart';
import 'package:moyin_challenge/providers/userProvider.dart';
import 'package:moyin_challenge/services/authService.dart';
import 'package:moyin_challenge/services/firebaseservice.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  String username;
  String password;
  String email;
  String error;
  bool autoValidate = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

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
            builder: (context,userProvider,_){
                      return  Column(
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
                  'Create your account ',
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
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFFF),
                            //  errorText: userProvider.getMessage(),
                            filled: true,
                            // errorText: email == null?'value cannot be empty':email,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            // border: InputBorder.none,
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              ) ,
                            ),
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              )
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child:
                                      SvgPicture.asset('assets/images/user.svg')),
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
                          onSaved: (val) => email = val,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFFF),
                            //  errorText: userProvider.getMessage(),
                            filled: true,
                            // errorText: email == null?'value cannot be empty':email,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            // border: InputBorder.none,
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              ) ,
                            ),
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              )
                            ),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child:
                                      SvgPicture.asset('assets/images/mail.svg')),
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
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFFFFFFFF),
                            //  errorText: userProvider.getMessage(),
                            filled: true,
                            // errorText: email == null?'value cannot be empty':email,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            // border: InputBorder.none,
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              ) ,
                            ),
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xFFD8D8DF), width: 1
                              )
                            ),
                            
                            // suffix: RawMaterialButton(
                            //         onPressed: _toggle,
                            //         child: Text(
                            //           obscureText ? "Show" : "Hide",
                            //           style: TextStyle(
                            //             // color: MColors.primaryPurple,
                            //             // fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            suffix:GestureDetector(
                              onTap:_toggle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(  obscureText ? "Show" : "Hide",),
                              )),
                            
                                  suffixIconConstraints:BoxConstraints(minHeight:10.0),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child:
                                      SvgPicture.asset('assets/images/lock.svg')),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            // prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      SizedBox(height: ScreenUtil().setHeight(55)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: MaterialButton(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            height: ScreenUtil().setHeight(50),
                            onPressed: () =>_submit(),
                            color: Color(0xFF257ED9),
                            child: Center(
                                child:
                                    //  userProvider.isLoading()
                                    //     ? CircularProgressIndicator(
                                    //         backgroundColor: Colors.white, strokeWidth: 2):
                                    Text('Signup',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(14))))),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()));
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "Don't have an account ?",
                                style: TextStyle(color: Color(0xFF687593)),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'Login', style: TextStyle(fontSize: 15))
                            ])),
                      )
                    ],
                  ),
                )
              ],
            );},
          ),
        ));
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  _submit() async{
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
    print('this function was called');
    // print(password);
    final form = formKey.currentState;


    try {
      if (form.validate()) {
        form.save();
        // userProvider.addUser(username, email, password).then(() {
        //   userProvider.setLoading(true);
        // }).catchError((e) {
        //   userProvider.setMessage(e);
        // });
        await AuthService().createUserWithEmailandPassword(email, password, username).then((data){
          print(data);
          print(username);
          if(data !=null){
            print(username);
            FirebaseService.addUser(username, email);
          }
        });
      } else {
        print('form didnt validate');
        setState(() {
        
          autoValidate = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
