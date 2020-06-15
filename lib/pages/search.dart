import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final int cindex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xFFE5EAF5),
       backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.08),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(

                  // alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Text('Search', style: TextStyle(fontSize: 18.0)),
            ],
          ),
          SizedBox(height: size.height * 0.035),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Container(
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
                        decoration: InputDecoration(
                          hintText: 'Parfait Recipe',
                          border: InputBorder.none,
                          // suffixIcon: Icon(Icons.search, size: 25)
                          // prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  
                    width: size.width,
                    height: size.height * 0.23,
                    child: Card(
                        color: Color(0xFFF7F7F9),
                        child:
                            // color:Colors.green,
                            Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Parfait Recipe',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      '08 jan, 7:30pm',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 18.0)
                              ]),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                            style: TextStyle(color: Colors.grey),
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
