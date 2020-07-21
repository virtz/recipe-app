import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moyin_challenge/models/recipe.dart';

class User{
  String name;
  String email;
  List<Recipe> recipes = List<Recipe>();

  DocumentReference reference;
User({this.name,this.email,this.recipes});

factory User.fromSnapshot(DocumentSnapshot snapshot){
  User newUser = User.fromJson(snapshot.data);
  newUser.reference = snapshot.reference;
  return newUser;

}

User.fromJson(Map<String, dynamic> data){
  name = data['name'];
  email = data['email'];
  recipes = _convertRecipes(data['recipes'] as List);
}

Map<String,dynamic> toJson(){
return{
  'name':name,
  'email':email,
  'recipes':recipes,
};
}
  @override
  String toString() => "User<$name>";

  List<Recipe> _convertRecipes(List recipesMap){
    if(recipesMap == null){
      return null;
    }
  List<Recipe> recipes  =   List<Recipe>();
  recipesMap.forEach((value) { 
    recipes.add(Recipe.fromJson(value));
  });
  return recipes;
  }
  
}