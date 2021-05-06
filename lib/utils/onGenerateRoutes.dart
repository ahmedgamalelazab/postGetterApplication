import 'package:flutter/material.dart';
import 'package:post_fetcher_project/representation/screens/postScreen.dart';

class ApplicationRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case PostScreen.ScreenRoute:
        return MaterialPageRoute(
          builder: (context) => PostScreen(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => PostScreen(),
        );
        break;
    }
  }
}
