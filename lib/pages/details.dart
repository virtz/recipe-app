import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Details extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  const Details({Key key, this.title, this.date, this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        // backgroundColor: Color(0xFFE5EAF5),
         backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.08),
              IconButton(
                
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                     Navigator.of(context).pop();
                  }),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title ==null?'Parfait Recipe':title,
                                style: TextStyle(
                                    fontSize: 22.0, fontWeight: FontWeight.bold)),
                         SizedBox(height: size.height * 0.009),
                        Text(
                          '8-16-2020',
                          style: TextStyle(color: Colors.grey),
                        ),
                        
                          ],
                        ),
                        Row(children: <Widget>[
                          Icon(FontAwesomeIcons.edit,color:Colors.grey,size:25),
                          SizedBox(width: 6,),
                          Icon(FontAwesomeIcons.trashAlt,color:Colors.grey,size:25)
                        ],)
                      ],
                    ),
                   
                    SizedBox(height: size.height * 0.02),
                    Container(
                      height: size.height * 0.65,
                      child: SingleChildScrollView(
                                            child: Html(data: """
                                   <p>
                                   It is a long established fact that a reader will be 
                                   distracted by the readable content of a page when looking 
                                   at its layout. The point of using Lorem Ipsum is that it has a 
                                   more-or-less normal distribution of letters, as opposed to using]
                                    'Content here, content here', making it look like readable English. 
                                    Many desktop publishing packages and web page editors now use Lorem 
                                    Ipsum as their default model text, and a search for 'lorem ipsum' will
                                     uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                                     There are many variations of passages of Lorem Ipsum available, 
                                     but the majority have suffered alteration in some form,
                                     by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour,
                                      or non-characteristic words etc.
                                      The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
                                   </p>
                                   """,
                                   defaultTextStyle: TextStyle(
                                     color:Colors.grey,
                                     fontSize:15.0
                                   ),
        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}