import 'package:flutter/material.dart';
import 'package:moviesapp/core/services/services_locator.dart';
import 'package:moviesapp/core/utils/app_string.dart';
import 'package:moviesapp/movies/domain/entities/movie.dart';
import 'package:moviesapp/movies/presentation/screens/movies_screen.dart';

import 'movies/presentation/screens/Test.dart';

void main() {
  ServicesLocator().init();
 // ServicesLocator().init();

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );


  }
}

