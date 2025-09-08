import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'configs/routes/routes_manager.dart';
import 'configs/routes/routes_name.dart';
import 'configs/theme/app_theme_data.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, // Setting theme mode to dark
        theme: AppThemeData.lightThemeData, // Setting light theme
        darkTheme: AppThemeData.darkThemeData, // Setting dark theme      title: 'task',

        initialRoute: RoutesName.home, // Initial route
        onGenerateRoute: Routes.generateRoute// Genera
           );
  }
}
