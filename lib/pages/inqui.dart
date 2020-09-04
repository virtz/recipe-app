import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:moyin_challenge/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Inquisition extends StatelessWidget {
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

    TextEditingController _controller = TextEditingController();

  


 var userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Color(0xFFF9FDFF),
        //  backgroundColor: Colors.white,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenUtil().setHeight(60)),
              Text('Welcome,',
                  style: TextStyle(
                      color: Color(0xFF2A3A64),
                      fontSize: ScreenUtil().setSp(22),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Text(
                'help us know you.',
                style: TextStyle(
                    color: Color(0xFF2A3A64), fontSize: ScreenUtil().setSp(16)),
              ),
              SizedBox(height: ScreenUtil().setHeight(50)),
              Container(
                width: size.width,
                height: ScreenUtil().setHeight(50),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFFF),
                    border: Border.all(color: Color(0xFFD8D8DF), width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: TextFormField(
                  controller: _controller,
                  autocorrect: true,
                  onChanged: (value){
                    userProvider.setMessage(null);
                  },
                  enabled: !userProvider.isLoading(),
                  decoration: InputDecoration(
                     errorText: userProvider.getMessage(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(fontSize: ScreenUtil().setSp(14)),
                    border: InputBorder.none,

                    // prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(50)),
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
                        child: userProvider.isLoading()
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white, strokeWidth: 2):Text('Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(16))))),
              ),
            ],
          ),
        ));
  }
}
