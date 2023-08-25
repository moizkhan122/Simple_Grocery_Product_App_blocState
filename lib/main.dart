import 'package:flutter/material.dart';

import 'Features/Home/UI/HomeSCreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(color: Colors.green)
      ),

      home:  HomeScreen(),
    );
  }
}

