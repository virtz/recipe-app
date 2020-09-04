import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:moyin_challenge/models/recipe.dart';
import 'package:moyin_challenge/services/authService.dart';

class RecipeService {
  final db = Firestore.instance;
  Recipe recipe = Recipe();

  addRecipe(Recipe recipe) async {
    final uEmail = await AuthService().getCurrentEmail();

    await db
        .collection('userData')
        .document(uEmail)
        .collection('recipes')
        // .add(recipe.toJson()).catchError((e){
        //   print(e);
        // });
        .document(recipe.title)
        .setData(recipe.toJson())
        .catchError((e) {
      print(e);
    });
  }


  getRecipes() async {
    final uEmail = await AuthService().getCurrentEmail();

   QuerySnapshot snapshot =  await db
        .collection('userData')
        .document(uEmail)
        .collection('recipes')
        .getDocuments().catchError((e){
          if(e is PlatformException){
            print(e);
          }
        });

  List<Recipe> recipeList = [];
  snapshot.documents.forEach((document) { 
    Recipe recipe = Recipe.fromJson(document.data);
    recipeList.add(recipe);
    print(recipeList[0].content);
    return recipeList;
  });
        
  }
}
