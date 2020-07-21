import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moyin_challenge/pages/details.dart';
import 'package:moyin_challenge/pages/search.dart';
import 'package:moyin_challenge/util/recipe.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var recpe = Recipe();

  bool stch = true;
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
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(60)),
            Text('Hi Joshua,',
                style: TextStyle(
                    color: Color(0xFF2A3A64),
                    fontSize: ScreenUtil().setSp(22),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: ScreenUtil().setHeight(7)),
            Text(
              'how are you today?',
              style: TextStyle(
                color: Color(0xFF2A3A64),
                fontSize: ScreenUtil().setSp(15),
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(35)),
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
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontSize: ScreenUtil().setSp(14)),
                      border: InputBorder.none,

                      // prefixIcon: Icon(Icons.person),
                        suffixIconConstraints: BoxConstraints(maxHeight: 20.0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Icon(Icons.search),
                      )
                    ),
                  ),
                ),
            SizedBox(height: ScreenUtil().setHeight(35)),
            Text(
              'Notes',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF257ED9)),
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
// Spacer(),
            Expanded(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2),
                  itemCount: recipe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Details(
                                    title: recipe[index].title,
                                  )));
                        },
                        child: Card(
                          elevation: 8,
                          shadowColor: Color.fromRGBO(180, 180, 181, 0.1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Color(0xFFFFFFFF),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color.fromRGBO(216, 216, 223, 0.8)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.w),
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          recipe[index].title,
                                          style: TextStyle(
                                            color: Color.fromRGBO(25, 30, 81, 0.88),
                                              fontWeight: FontWeight.w400,
                                              fontSize: ScreenUtil().setSp(15)),
                                        ),
                                        SizedBox(
                                          height:ScreenUtil().setHeight(5)
                                        ),
                                        Text(recipe[index].date,
                                            style: TextStyle(

                                                fontSize: ScreenUtil().setSp(11),
                                                color: Color.fromRGBO(25, 30, 81, 0.7))),
                                      ],
                                    ),
                                    Container(
                                        child: SvgPicture.asset(
                                            'assets/images/chevron-right.svg',
                                            height: 21,
                                            color: Color.fromRGBO(
                                                25, 30, 81, 0.88))),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10)
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10)
                                ),
                                Text(recipe[index].content,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(12.0), color: Color.fromRGBO(25, 30, 81, 0.55)))
                              ]),
                            ),
                          ),
                        ));
                  }),
            )
            // : Container(),
          ],
        ),
      ),
    );
  }
}
