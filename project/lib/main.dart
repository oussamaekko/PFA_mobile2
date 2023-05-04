import 'package:project/home_terrain.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      MaterialColor primaryColor = MaterialColor(
      0xFF44E4BF,
      <int, Color>{
        50: Color(0xFFE0F5F3),
        100: Color(0xFFB3E9E0),
        200: Color(0xFF80DCCD),
        300: Color(0xFF4DCFB9),
        400: Color(0xFF26C4AB),
        500: Color(0xFF44E4BF),
        600: Color(0xFF00BFA5),
        700: Color(0xFF00BFA5),
        800: Color(0xFF00897B),
        900: Color(0xFF00695C),  
      },
    );

    return MaterialApp(
      title: 'Gold_foot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      
      //you can display here also HomeClub() or HomZone()
      home: const HomeTerrain(),
    );
  }
}


