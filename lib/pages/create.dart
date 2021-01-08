import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moyin_challenge/providers/recipeProvider.dart';
import 'package:provider/provider.dart';

class Create extends StatefulWidget {
  final int id;
  final String title;
  final String date;
  final String content;

  const Create({Key key, this.id, this.title, this.date, this.content})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Create> {
  final formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  String title;
  String content;
  String date;

  var error;

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

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//for snackbar
    void showSnackBar(String message) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating));
    }

//cupertino dialogue method
    _showCupertinoDialog(BuildContext context) {
      final userProvider = Provider.of<RecipeProvider>(context, listen: false);
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

//method to save
    done() async {
      final recipeProvider =
          Provider.of<RecipeProvider>(context, listen: false);
      final form = formKey.currentState;
      if (form.validate()) {
        print('function was called');
        form.save();
        bool done = true;
        recipeProvider.setLoading(true);
        await recipeProvider
            .addRecipe(title, date, content, done)
            .catchError((e) {
          setState(() {
            // error = e.message;
          });
        });
        recipeProvider.getMessage();

        if (recipeProvider.errorMessage != null &&
            recipeProvider.errorMessage == 'successful') {
          showSnackBar("Saved successfully");
          title = " ";
          date = " ";
          content = " ";
        } else if ((recipeProvider.errorMessage == null ||
            recipeProvider.errorMessage != 'successful')) {
          _showCupertinoDialog(context);
        }
      } else {
        setState(() {
          autoValidate = true;
        });
        print('its not working');
      }
    }

    return Scaffold(
        // backgroundColor: Color(0xFFE5EAF5),
        key: _scaffoldKey,
        backgroundColor: Color(0xFFF9FDFF),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child:
              Consumer<RecipeProvider>(builder: (context, recipeProvider, _) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 30)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Text('Create',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(16.0),
                              color: Color(0xFF2A3A64))),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                width: ScreenUtil()
                                    .setWidth(defaultScreenWidth - 165)),
                            GestureDetector(
                              onTap: done,
                              child: recipeProvider.isLoading()
                                  ? CircularProgressIndicator(
                                      strokeWidth: 1,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    )
                                  : Text('Done',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(16.0),
                                          color: Color(0xFF257ED9))),
                            )
                          ])
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Form(
                      autovalidate: autoValidate,
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text(title == null ? 'Parfait Recipe' : title,
                                    //     style: TextStyle(
                                    //         color: Color(0xFF2A3A64),
                                    //         fontSize: ScreenUtil().setSp(20.0),
                                    //         fontWeight: FontWeight.bold)),
                                    Container(
                                      child: TextFormField(
                                        initialValue: widget.title ?? null,
                                        onSaved: (val) => title = val,
                                        autocorrect: true,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Sorry fam, you can't leave this blank";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20.0),
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            //           enabledBorder: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(6),
                                            //   borderSide: BorderSide(
                                            //       color: Color(0xFFD8D8DF), width: 1),
                                            // ),
                                            hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(20.0),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      width: ScreenUtil().setWidth(200),
                                      height: ScreenUtil().setHeight(35),
                                    ),
                                    // SizedBox(height: ScreenUtil().setHeight(15)),
                                    Container(
                                      child: TextFormField(
                                        initialValue: widget.date ?? null,
                                        onSaved: (val) => date = val,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Sorry fam, you can't leave this blank";
                                          }
                                          return null;
                                        },
                                        autocorrect: true,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          fontSize: ScreenUtil().setSp(15.0),
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //           enabledBorder: OutlineInputBorder(
                                          //   borderRadius: BorderRadius.circular(6),
                                          //   borderSide: BorderSide(
                                          //       color: Color(0xFFD8D8DF), width: 1),
                                          // ),
                                          hintText: 'date',
                                          hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(12.0),
                                          ),
                                        ),
                                      ),
                                      width: ScreenUtil().setWidth(200),
                                    )
                                    //  height: ScreenUtil().setHeight(35),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: widget.title == null
                                          ? null
                                          : saveEditedRecipe,
                                      child: Icon(Icons.update_rounded,
                                          color: Colors.grey, size: 35),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    // Icon(FontAwesomeIcons.trashAlt,
                                    //     color: Colors.grey, size: 25)
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(15)),
                          Container(
                            width:
                                ScreenUtil().setWidth(ScreenUtil.defaultWidth),
                            // height: ScreenUtil().setHeight(defaultScreenHeight-270),
                            // height: size.height <= 1000 ? 400 : 200,

                            child: TextFormField(
                                initialValue: widget.content ?? null,
                                onSaved: (val) => content = val,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Sorry fam, you can't leave this blank";
                                  }
                                  return null;
                                },
                                maxLength: 1000,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                autocorrect: true,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenUtil().setSp(13.0),
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'content')),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ));
  }

  saveEditedRecipe() {
    print('tapped');
  }
}
