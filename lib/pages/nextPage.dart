import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moyin_challenge/pages/details.dart';
import 'package:moyin_challenge/pages/newpage.dart';
import 'package:moyin_challenge/pages/search.dart';
import 'package:moyin_challenge/util/recipe.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int cindex = 0;

  var recpe = Recipe();

  bool stch = true;
  final List<Widget> _children = [
    NewPage(),
    Details(),
    Search()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Color(0xFFE5EAF5),
         backgroundColor: Colors.white,
        body: _children[cindex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BottomNavigationBar(
            currentIndex: cindex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon:Icon(Icons.home) ,
                  icon: Icon(Icons.home, color: Colors.grey),
                  title: new Text(
                    'Home',
                    style: TextStyle(fontSize: 11.0, color: Colors.grey),
                  )),
              BottomNavigationBarItem(
                  activeIcon:Icon(FontAwesomeIcons.edit,size: 20.0,) ,
                  icon: Icon(FontAwesomeIcons.edit, color: Colors.grey,size: 20.0,),
                  title: new Text(
                    'Create',
                    style: TextStyle(fontSize: 11.0, color: Colors.grey),
                  )),
              BottomNavigationBarItem(
                  activeIcon:Icon(Icons.search) ,
                  icon: Icon(Icons.search, color: Colors.grey),
                  title: new Text(
                    'Search',
                    style: TextStyle(fontSize: 11.0, color: Colors.grey),
                  )),
              BottomNavigationBarItem(
                  activeIcon:Icon(Icons.settings) ,
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: new Text(
                    'Settings',
                    style: TextStyle(fontSize: 11.0, color: Colors.grey),
                  ))
            ],
            onTap: onTabTapped,
          ),
        ));
  }

  changeNumber() {
    if (stch == true) {
      setState(() {
        stch = false;
      });
    }
    if (stch == false) {
      setState(() {
        stch = true;
      });
    }
  }

  void onTabTapped(int index) {
   setState(() {
     cindex = index;
   });
 }
}
