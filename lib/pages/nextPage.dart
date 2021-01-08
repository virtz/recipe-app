import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:moyin_challenge/pages/create.dart';
import 'package:moyin_challenge/pages/newpage.dart';
import 'package:moyin_challenge/pages/search.dart';
import 'package:moyin_challenge/pages/settings.dart';
// import 'package:moyin_challenge/util/recipe.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int cindex = 0;
  // bool isSelected = _children == cindex;
  // var recpe = Recipe();

  bool stch = true;
  final List<Widget> _children = [NewPage(), Create(), Search(), Settings()];

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;

    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    ScreenUtil.init(context,
        width: defaultScreenWidth,
        height: defaultScreenHeight,
        allowFontScaling: true);

    // var size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Color(0xFFF9FDFF),
        backgroundColor: Colors.white,
        body: _children[cindex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(8.0)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            showUnselectedLabels: true,
            selectedFontSize: 9.0,
            // selectedItemColor: Colors.blue,
            unselectedLabelStyle: TextStyle(color: Colors.green, fontSize: 8.5),
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  activeIcon: Container(
                      child: SvgPicture.asset(
                    'assets/images/home.svg',
                    color: Color(0xFF257ED9),
                  )),
                  icon: Container(
                      child: SvgPicture.asset(
                    'assets/images/home.svg',
                    color: Colors.grey,
                  )),
                  title: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Text("Home"),
                  )),
              new BottomNavigationBarItem(
                  activeIcon: Container(
                      child: SvgPicture.asset('assets/images/edit1.svg')),
                  icon: Container(
                      child: SvgPicture.asset(
                    'assets/images/edit.svg',
                    color: Colors.grey,
                  )),
                  title: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Text("Create"),
                  )),
              // new BottomNavigationBarItem(
              //     activeIcon: Container(
              //         child: SvgPicture.asset('assets/images/search1.svg')),
              //     icon: Container(
              //         child: SvgPicture.asset(
              //       'assets/images/search.svg',
              //       color: Colors.grey,
              //     )),
              //     title: Padding(
              //       padding: const EdgeInsets.all(3.0),
              //       child: new Text("Search"),
              //     )),
              new BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/images/settings1.svg'),
                  icon: Container(
                      child: SvgPicture.asset(
                    'assets/images/settings.svg',
                    color: Colors.grey,
                  )),
                  title: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Text(
                      "Settings",
                    ),
                  ))
            ],
            currentIndex: cindex,
            onTap: (int i) {
              setState(() {
                cindex = i;
              });
            },
            fixedColor: Color(0xFF257ED9),
          ),
        ));
  }

  // changeNumber() {
  //   if (stch == true) {
  //     setState(() {
  //       stch = false;
  //     });
  //   }
  //   if (stch == false) {
  //     setState(() {
  //       stch = true;
  //     });
  //   }
  // }

  void onTabTapped(int index) {
    setState(() {
      cindex = index;
    });
  }
}
