import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moyin_challenge/pages/create.dart';

class Details extends StatefulWidget {
  final int id;
  final String title;
  final String date;
  final String content;

  const Details({Key key, this.title, this.date, this.content, this.id})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    return Scaffold(
        backgroundColor: Color(0xFFF9FDFF),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(

                    // alignment: Alignment.topLeft,
                    icon: Container(
                        child: SvgPicture.asset(
                            'assets/images/chevron-left.svg',
                            height: 30)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Text('Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(16.0),
                        color: Color(0xFF2A3A64))),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF2A3A64))),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(widget.date,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF191E51)))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => editRecipe(),
                              child: Icon(FontAwesomeIcons.edit,
                                  color: Colors.grey, size: 25),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(FontAwesomeIcons.trashAlt,
                                color: Colors.grey, size: 25)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.content,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey)))
                  ],
                )),
          ]),
        ));
  }

  editRecipe() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Create(
          id:widget.id,
            title: widget.title, date: widget.date, content: widget.content)));
  }
}
