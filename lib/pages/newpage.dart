

import 'package:flutter/material.dart';
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
    return Scaffold(
      // backgroundColor: Color(0xFFE5EAF5),
       backgroundColor: Colors.white,
body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.08),
              Text('Hi Joshua,',
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
              Text(
                'how are you?',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              SizedBox(height: size.height * 0.05),
              GestureDetector(
                onTap: () {
                  print(stch);
                  // changeNumber();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Search()));
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.07,
                  child: Material(
                    color: Color(0xFFF7F7F9),
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      child: TextFormField(
                        focusNode: FocusNode(),
                       
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.search, size: 25)
                            // prefixIcon: Icon(Icons.person),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Text(
                'Notes',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1F13E8)),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: size.width,
                height: size.height * 0.56,
                child: stch == true
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.65,
                            // mainAxisSpacing: 3,
                            crossAxisSpacing: 2.5,
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
                            child: Container(
                                // width: 300,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: Color(0xFFF9F9F9),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15.0),
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
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13.5),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(recipe[index].date,
                                                  style: TextStyle(
                                                    fontSize:11,
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              size: 18)
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.015,
                                      ),
                                      Text(recipe[index].content,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey))
                                    ]),
                                  ),
                                )),
                          );
                        })
                    : Container(),
              ),
            ],
          ),
        ),
    );
  }
}