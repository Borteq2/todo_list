import 'package:flutter/material.dart';
import 'package:to_do_list/ui/main_navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
