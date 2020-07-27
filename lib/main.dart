import 'package:flutter/material.dart';
import 'package:moyin_challenge/pages/home.dart';
import 'package:moyin_challenge/providers/userProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<UserProvider>(
          create:(_)=>UserProvider()
        ),
      
      ],
      child:MaterialApp(
      title: 'Recipe',
      theme: ThemeData(
     
        primaryColor: Color(0xFF257ED9),
      ),
      
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    
    )
    );
  }
}

