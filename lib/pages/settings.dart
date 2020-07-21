import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    //  printScreenInformation();
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
  ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

        return Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(60)),
              Text('Welcome,',
                  style:
                      TextStyle(fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold)),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Text(
                'help us know you.',
                style: TextStyle(color: Colors.grey, fontSize:ScreenUtil().setSp(16),),
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Container(
                width: ScreenUtil().setWidth(defaultScreenWidth),
              
                height: ScreenUtil().setHeight(65),
                child: Material(
                  color: Color(0xFFF9F9F9),
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.w, vertical: 8.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        border: InputBorder.none,
                        // prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:20.w),
                child: MaterialButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: ScreenUtil().setHeight(60),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => NextPage()));
                    },
                    color: Color(0xFF1F13E8),
                    child: Center(
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: ScreenUtil().setSp(16),)))),
              ),
            ],
          ),
        ));
        

  }
}
