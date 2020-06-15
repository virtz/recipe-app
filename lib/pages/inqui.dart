import 'package:flutter/material.dart';
import 'package:moyin_challenge/pages/nextPage.dart';

class Inquisition extends StatelessWidget {
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
              SizedBox(height: size.height * 0.1),
              Text('Welcome,',
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.01),
              Text(
                'help us know you.',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                width: size.width,
                height: size.height * 0.07,
                child: Material(
                  color: Color(0xFFF9F9F9),
                  elevation: 2.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
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
              SizedBox(height: size.height * 0.06),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: MaterialButton(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    height: size.height * 0.065,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => NextPage()));
                    },
                    color: Color(0xFF1F13E8),
                    child: Center(
                        child: Text('Continue',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0)))),
              ),
            ],
          ),
        ));
  }
}
