
import 'package:bus_seat_selection/configs/routes/routes_name.dart';
import 'package:bus_seat_selection/view/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
