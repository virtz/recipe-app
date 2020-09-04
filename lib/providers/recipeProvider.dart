import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:moyin_challenge/models/recipe.dart';
import 'package:moyin_challenge/services/recipeService.dart';

class RecipeProvider with ChangeNotifier {
  var errorMessage;
  bool loading = false;

  bool isLoading() {
    return loading;
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  void getMessage() {
    return errorMessage;
  }

  addRecipe(String title, String date, content, bool done) async {
    Recipe recipe =
        Recipe(title: title, date: date, content: content, done: done);
    try {
      await RecipeService().addRecipe(recipe).then((data) {
        setLoading(true);
        setMessage('successful');

        notifyListeners();
      });
      setLoading(false);
    } catch (e) {
      setMessage(e.message);
      setLoading(false);
    }
  }

  getRecipes() async {
    try {
      await RecipeService().getRecipes().then((data) {
        setLoading(true);
        setMessage('successful');

        notifyListeners();
      });

      setLoading(false);
    } catch (e) {
      setMessage(e.message);
      setLoading(false);
    }
    // return recipes;
  }
}
