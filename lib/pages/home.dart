

import 'package:flutter/material.dart';
import 'package:moyin_challenge/pages/inqui.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
    backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:15.0),
        child: Column(
         
          children: <Widget>[
          SizedBox(height:size.height *  0.11),
          Align(
            alignment: Alignment.topCenter,
            child: Text('Recipe App',style:TextStyle(fontSize:22.0,fontWeight: FontWeight.bold))
          ),
          SizedBox(height:size.height *  0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text("Lorem Ipsum is simply dummy text of the printing  ",style:TextStyle(color:Colors.grey,)),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text("typesetting industry. Lorem Ipsum has been",style:TextStyle(color:Colors.grey,)),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text("the industry's standard dummy text",style:TextStyle(color:Colors.grey,)),
          ),
          Container(
            width: size.width,
            height:size.height * 0.5,
            decoration:BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/images/chef1.png'))
            )
          ),
           SizedBox(height:size.height *  0.15),
          GestureDetector(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=>Inquisition()));
            },
                      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Next',style:TextStyle(color: Color(0xFF1F13E8),fontWeight:FontWeight.w600)),
                  SizedBox(width: 6.0,),
                  Icon(Icons.arrow_forward,color: Color(0xFF1F13E8))
                ],),
            ),
          )
        ],),
      )
    );
  }
}