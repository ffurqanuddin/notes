import 'package:flutter/material.dart';

import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/sign_up_page.dart';
import '../../features/home/view/home.dart';

class MyRoutes {
  static String home = "/";
  static String login = "login";
  static String singUp = "signup";

  final Map<String, Widget Function(BuildContext)> _routes = {
    home: (context) => const HomePage(),
    login: (context) => LoginPage(),
    singUp: (context) => SignUpPage(),
  };

  get getRoutes => _routes;
}
