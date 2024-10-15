import 'package:logger/web.dart';
import 'package:sqflite/sqflite.dart';

import '../../headers.dart';

enum RecipeTable {
  catagory,
  price,
  name,
}

class LikeDatabase {
  LikeDatabase._();
  static final LikeDatabase instance = LikeDatabase._();

  String dbName = 'recipeDataBase.db';
  late Database database;
  String likeTable = 'favTable';
  String sql = 'Query here';

  Future<void> initDatabase() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      "$likeTable/$dbPath",
      version: 1,
      onCreate: (db, v) {
        String sql = """ CREATE TABLE IF NOT EXISTS $likeTable (
           ${RecipeTable.name.name} INTEGER PRIMARY KEY AUTOINCREMENT,
           ${RecipeTable.catagory.name} TEXT,
           ${RecipeTable.price.name} TEXT,
           );""";
        db
            .execute(sql)
            .then(
              (value) => Logger().i(" Created Table $likeTable"),
            )
            .onError(
              (error, stackTrace) => Logger().e("Error $error"),
            );
      },
    );
  }

  void getallData() {}
  void addFavRecipe() {}
  void deleteFavRecipe() {}
}
