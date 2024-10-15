import 'package:flutter/cupertino.dart';

import '../modal/recipe_modal.dart';

class RecipeController extends ChangeNotifier {
  List<RecipeModal> allRecipe = [];
  List<RecipeModal> allFavRecipe = [];

  RecipeController() {
    getaAllRecipe();
  }
  void getaAllRecipe() {}
  void initDataBase() {}
  void addFavRecipe() {}
}
