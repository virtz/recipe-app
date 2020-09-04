import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moyin_challenge/pages/login.dart';

import 'package:moyin_challenge/pages/nextPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

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
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF9FDFF),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.11),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text('Recipe App',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(22.0),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2A3A64)))),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing  ",
                    style: TextStyle(color: Color.fromRGBO(42, 58, 100, 0.8))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("typesetting industry. Lorem Ipsum has been",
                    style: TextStyle(color: Color.fromRGBO(42, 58, 100, 0.8))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("the industry's standard dummy text",
                    style: TextStyle(color: Color.fromRGBO(42, 58, 100, 0.8))),
              ),
              // Spacer(),
              SizedBox(height: ScreenUtil().setHeight(50)),
              Container(
                width: ScreenUtil().setWidth(defaultScreenWidth - 100),
                height: ScreenUtil().setHeight(300),
                child: SvgPicture.asset('assets/images/chef.svg',
                    fit: BoxFit.contain),
                // decoration:BoxDecoration(
                // )
              ),
              SizedBox(height: ScreenUtil().setHeight(200)),
              GestureDetector(
                onTap: () {
                  //            Navigator.of(context).push(MaterialPageRoute(
                  // builder: (BuildContext context) =>  Login()));
                  next(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Next',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: ScreenUtil().setSp(13.74),
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  next(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedin');
    print(prefs.getBool('isLoggedin'));

    if (isLoggedIn == true) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => NextPage()));
    } else if (isLoggedIn == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    } else if (isLoggedIn == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    }
  }
}
