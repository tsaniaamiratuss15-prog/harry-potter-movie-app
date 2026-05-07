import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/form_page.dart';
import 'pages/orientation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Harry Potter Movie App',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),

      routes: {
        '/form': (context) => FormPage(),
        '/orientation': (context) => OrientationPage(),
      },
    );
  }
}