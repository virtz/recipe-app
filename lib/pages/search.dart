import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  final int cindex = 0;
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
      body: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(60)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(

                  // alignment: Alignment.topLeft,
                  icon: Container(
                      child: SvgPicture.asset(
                    'assets/images/chevron-left.svg',
                    height: 30,
                  )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Text('Search',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(16))),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFFF),
                      border: Border.all(color: Color(0xFFD8D8DF), width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal:8.w),
                      // contentPadding: EdgeInsets.all(ScreenUtil().setWidth(1.5)),
                      hintText: 'Parfait Recipe',
                      hintStyle:
                          TextStyle(fontSize: ScreenUtil().setSp(14)),
                      border: InputBorder.none,

                      // prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(25)),
                Container(
                    width: size.width,
                    // height: ScreenUtil().setHeight(150),
                    height: size.height <=1000?150:1800,
                    child: Card(
                        color: Color(0xFFFFFFFFF),
                        child:
                            // color:Colors.green,
                            Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.w),
                          child: Column(
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Parfait Recipe',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(15.0),
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text(
                                          '08 jan, 7:30pm',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(25, 30, 81, 0.7),
                                            fontSize: ScreenUtil().setSp(12),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        child: SvgPicture.asset(
                                            'assets/images/chevron-right.svg',
                                            height: 21,
                                            color: Color.fromRGBO(
                                                25, 30, 81, 0.88))),
                                  ]),
                              SizedBox(height: ScreenUtil().setHeight(8)),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(8)),
                              Text(
                                'It is a long established fact that a reader will be distracted by the readable ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil().setSp(13)),
                              )
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
