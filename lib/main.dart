import 'package:flutter/material.dart';
import 'Launcher.dart';
import 'widgets/loading.dart';
import 'LocationDetails.dart';
import 'MyColors.dart';
import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMD Weather",
      theme: ThemeData(
          fontFamily: 'Quicksand',
          textTheme: TextTheme(
              title: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 45.0,
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
        '/home': (context) => Home(),
        '/loading': (context) => Loading(),
        '/location': (context) => LocationDetails(),
      },
    );
  }
}

