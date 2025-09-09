
import 'package:bus_seat_selection/bloc/busSeatBloc/bus_seat_bloc.dart';
import 'package:bus_seat_selection/repositories/bus_layout_repo/bus_seat_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/routes/routes_manager.dart';
import 'configs/routes/routes_name.dart';
import 'configs/theme/app_theme_data.dart';
void main()async {


  runApp(const MyApp()); // Running the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => BusSeatBloc( busSeatRepo: BusSeatRepoImpl()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, // Setting theme mode to dark
        theme: AppThemeData.lightThemeData, // Setting light theme
        darkTheme: AppThemeData.darkThemeData, // Setting dark theme      title: 'task',

        initialRoute: RoutesName.home, // Initial route
        onGenerateRoute: Routes.generateRoute, // Generating routes
      ),
    );
  }
}


