
import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe{
  // String recipe;
  String title;
  DateTime date;
  bool done;
  String content;

  DocumentReference reference;

  Recipe({this.title,this.date,this.done,this.reference,this.content});

//   factory Recipe.fromJson(Map<dynamic,dynamic> json) => _RecipeFromJson(json);
//     Map<String,dynamic> toJson() => _RecipeToJson(this);
      
//         String toString()=>"Vacination<$title>";

// Recipe _RecipeFromJson(Map<dynamic,dynamic> json){
//   return Recipe(
//     title:json['title'] as String,
//     date: json['date'] == null? null:(json[date] as Timestamp).toDate(),
//     done:json['done'] as bool,
//     content:json['content'] as String,
//   );
// }

// Map<String,dynamic> _RecipeToJson(Recipe instance)=><String,dynamic>{
//   'tite':instance.title,
//   'date':instance.date,
//   'done':instance.done,
//   'content':instance.content,
// };

Recipe.fromJson(Map<String,dynamic>data){
  title=data['title'];
  date = data['date'];
  done = data['done'];
  content = data['content'];

}
Map<String,dynamic> toJson(){
  return{
    'title':title,
    'date':date,
    'done':done,
    'content':content
  };
}
           String toString()=>"Vacination<$title>"; 
}
    