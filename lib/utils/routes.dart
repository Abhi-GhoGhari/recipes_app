import 'package:flutter/cupertino.dart';
import 'package:recipes_app/view/screen/pages/home_page/home_page.dart';
import 'package:recipes_app/view/screen/pages/like_page/like_page.dart';
import 'package:recipes_app/view/screen/pages/splash_screen/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String splashscreen = '/';
  String homepage = 'home_page';
  String likepage = 'like_page';

  Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const SplashScreen(),
    'home_page': (context) => const HomePage(),
    'like_page': (context) => const LikePage(),
  };
}
