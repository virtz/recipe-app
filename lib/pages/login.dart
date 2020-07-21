import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moyin_challenge/pages/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String username;
  String password;
  String error;
  bool autoValidate = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
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
                  key: formKey,
                  autovalidate: autoValidate,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: size.width,
                        height: ScreenUtil().setHeight(50),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFFF),
                            border:
                                Border.all(color: Color(0xFFD8D8DF), width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          // controller: _controller,
                          autocorrect: true,
                          onSaved: (val) => setState(() => username = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return value;
                          },
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            //  errorText: userProvider.getMessage(),
                            // filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child: SvgPicture.asset(
                                      'assets/images/user.svg')),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            // prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Container(
                        width: size.width,
                        height: ScreenUtil().setHeight(50),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFFF),
                            border:
                                Border.all(color: Color(0xFFD8D8DF), width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: TextFormField(
                          // controller: _controller,
                          obscureText: obscureText,

                          autocorrect: true,
                          onChanged: (value) {
                            // userProvider.setMessage(null);
                          },
                          onSaved: (val) => setState(() => password = val),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            return value;
                          },

                          // validator: (val)=>,
                          // enabled: !userProvider.isLoading(),
                          decoration: InputDecoration(
                            suffix: RawMaterialButton(
                              onPressed: _toggle,
                              child: Text(obscureText ? "Show" : "Hide"),
                            ),
                            // suffixIconConstraints: BoxConstraints(maxHeight: 20.0),
                            //  errorText: userProvider.getMessage(),
                            // filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.w),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(11)),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                  child: SvgPicture.asset(
                                      'assets/images/lock.svg')),
                            ),
                            prefixIconConstraints:
                                BoxConstraints(maxHeight: 20.0),

                            // prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Align(
                        alignment: Alignment.topRight,
                         child: Text("Forgot Password ?",style:TextStyle(
                           color:Color(0xFF7B8295),
                           fontSize:ScreenUtil().setSp(11),
                         ))),
                         SizedBox(height: ScreenUtil().setHeight(55)),
                          Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: MaterialButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: ScreenUtil().setHeight(50),
                    onPressed: (){
                      
                    },
                    color: Color(0xFF257ED9),
                    child: Center(
                        child:
                        //  userProvider.isLoading()
                        //     ? CircularProgressIndicator(
                        //         backgroundColor: Colors.white, strokeWidth: 2):
                                Text('Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(14))))),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(20)),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder:(BuildContext context)=>SignUp()));
                            },
                                                      child: RichText(
                              text:TextSpan(
                                text:"Don't have an account ?",style:TextStyle(
                                  color:Color(0xFF687593)
                                ),
                                children: <TextSpan>[
                                  TextSpan(text:'SignUp',style:TextStyle(fontSize:15))
                                ]
                              )
                            ),
                          )
                          ],
                  ))
            ])));
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
