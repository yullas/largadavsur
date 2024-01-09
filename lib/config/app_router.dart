import 'package:flutter/material.dart';
import 'package:larga_davsur/screens/home/home_screen.dart';

import '../screens/location/location_screen.dart';
import '../screens/adduser.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Mali ni japon'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}
