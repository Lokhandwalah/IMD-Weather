import 'package:flutter/material.dart';
import 'screens//HomeScreen.dart';
import 'screens/HomePage.dart';
import 'screens/Launcher.dart';
import 'screens/Station.dart';
import 'screens/LocationDetails.dart';
import 'screens/Warnings.dart';
import 'values/MyColors.dart';
import 'screens/Region.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMD Weather",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
              title: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              body2: TextStyle(
                fontFamily: 'OpenSans',
                color: MyColors.color2,
                fontSize: 15.0,
              ))),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Launcher(),
        '/home': (context) => HomePage(),
        '/location': (context) => LocationDetails(),
        '/region': (context) => Region(),
        '/station': (context) => Station(),
        '/warnings': (context) => Warnings(),
      },
    );
  }
}
