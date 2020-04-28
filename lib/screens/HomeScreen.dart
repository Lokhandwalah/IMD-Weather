import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:imd_weather/values/MyColors.dart';
import 'package:imd_weather/values/MyTextStyles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var hour = int.parse(TimeOfDay.now().toString().substring(10, 12));

  @override
  Widget build(BuildContext context) {
    return Dates(hour);
  }
}

class MorningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'IMD - Western Zone',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: MyColors.tooltext,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          toolbarOpacity: 1.0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
                image: AssetImage(img(morningImages).toString()),
                fit: BoxFit.cover),
            SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Padding(
                        //padding used for text mumbai
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text("Mumbai",
                            style: TextStyle(
                              color: MyColors.morning,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0,
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      DateFormat('h:mm a E, d MMM y').format(DateTime.now()),
                      style: MyTextStyles.DateText,
                    ),
                    SizedBox(height: 35.0),
                    Text("22°C",
                        style: TextStyle(
                          color: MyColors.morning,
                          fontSize: 55.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        )),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.orangeAccent,
                        ),
                        Text('Sunny ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 200.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text('Wind',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text('Pressure',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Humidity',
                                        style: MyTextStyles.WPHText,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '5km/h',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '70%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '60%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text("Today's Weather Info.",
                                    style: MyTextStyles.Today),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 1.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 23.0),
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DateFormat('E, d MMM ')
                                            .format(DateTime.now()),
                                        style: MyTextStyles.DateText,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "22°C",
                                          style: MyTextStyles.DateText,
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "32°C",
                                          style: MyTextStyles.DateText,
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 22.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: Divider(
                                  height: 10.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text("Percipitation ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "70%",
                                        style: MyTextStyles.DetailsValue,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text("Wind",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("8 km/h",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Pressure",
                                        style: MyTextStyles.DetailHead,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text("940hPa",
                                          style: MyTextStyles.DetailsValue)),
                                  Expanded(
                                      flex: 4,
                                      child: Text("Humidity ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("65%",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Center(
                        child: Text(
                      "Next 7 Days Forecasts",
                      style: MyTextStyles.Highlight,
                    )),
                    SizedBox(height: 100.0),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

class EveningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'IMD - Western Zone',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: MyColors.tooltext,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          toolbarOpacity: 1.0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
                image: AssetImage(img(eveningImages).toString()),
                fit: BoxFit.cover),
            SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Padding(
                        //padding used for text mumbai
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text("Mumbai",
                            style: TextStyle(
                              color: MyColors.tp6,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0,
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      DateFormat('h:mm a E, d MMM y').format(DateTime.now()),
                      style: MyTextStyles.DateText1,
                    ),
                    SizedBox(height: 35.0),
                    Text("22°C",
                        style: TextStyle(
                          color: MyColors.morning,
                          fontSize: 55.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        )),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.orangeAccent,
                        ),
                        Text('Sunny ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 200.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text('Wind',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text('Pressure',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Humidity',
                                        style: MyTextStyles.WPHText,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '5km/h',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '70%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '60%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text("Today's Weather Info.",
                                    style: MyTextStyles.Today),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 1.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 23.0),
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DateFormat('E, d MMM ')
                                            .format(DateTime.now()),
                                        style: MyTextStyles.DateText,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "22°C",
                                          style: MyTextStyles.DateText,
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "32°C",
                                          style: MyTextStyles.DateText,
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 22.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: Divider(
                                  height: 10.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text("Percipitation ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "70%",
                                        style: MyTextStyles.DetailsValue,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text("Wind",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("8 km/h",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Pressure",
                                        style: MyTextStyles.DetailHead,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text("940hPa",
                                          style: MyTextStyles.DetailsValue)),
                                  Expanded(
                                      flex: 4,
                                      child: Text("Humidity ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("65%",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Center(
                        child: Text(
                      "Next 7 Days Forecasts",
                      style: MyTextStyles.Highlight,
                    )),
                    SizedBox(height: 100.0),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

class NightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'IMD - Western Zone',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: MyColors.tooltext,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          toolbarOpacity: 1.0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
                image: AssetImage(img(nightImages).toString()),
                fit: BoxFit.cover),
            SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Padding(
                        //padding used for text mumbai
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text("Mumbai",
                            style: TextStyle(
                              color: MyColors.color2,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 2.0,
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      DateFormat('h:mm a E, d MMM y').format(DateTime.now()),
                      style: MyTextStyles.DateText2,
                    ),
                    SizedBox(height: 35.0),
                    Text("22°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 55.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        )),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.orangeAccent,
                        ),
                        Text('Sunny ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 200.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text('Wind',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text('Pressure',
                                          style: MyTextStyles.WPHText)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Humidity',
                                        style: MyTextStyles.WPHText,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '5km/h',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '70%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '60%',
                                        style: MyTextStyles.WPHData,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Card(
                        color: MyColors.colorgreen,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text("Today's Weather Info.",
                                    style: MyTextStyles.Today),
                              ),
                              SizedBox(height: 7.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 1.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 0.0),
                                child: Divider(
                                  height: 3.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 23.0),
                                      child: Icon(
                                        Icons.wb_sunny,
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DateFormat('E, d MMM ')
                                            .format(DateTime.now()),
                                        style: MyTextStyles.DateText2,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "22°C",
                                          style: MyTextStyles.DateText2,
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "32°C",
                                          style: MyTextStyles.DateText2,
                                          textAlign: TextAlign.center,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 22.0),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    2.0, 0.0, 2.0, 0.0),
                                child: Divider(
                                  height: 10.0,
                                  color: MyColors.tp3,
                                  thickness: 2,
                                ),
                              ),
                              SizedBox(height: 42.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text("Percipitation ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        "70%",
                                        style: MyTextStyles.DetailsValue,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text("Wind",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("8 km/h",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 25.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Pressure",
                                        style: MyTextStyles.DetailHead,
                                        textAlign: TextAlign.start,
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text("940hPa",
                                          style: MyTextStyles.DetailsValue)),
                                  Expanded(
                                      flex: 4,
                                      child: Text("Humidity ",
                                          style: MyTextStyles.DetailHead)),
                                  Expanded(
                                      flex: 2,
                                      child: Text("65%",
                                          style: MyTextStyles.DetailsValue)),
                                ],
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Center(
                        child: Text(
                      "Next 7 Days Forecasts",
                      style: MyTextStyles.Highlight,
                    )),
                    SizedBox(height: 100.0),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}

var morningImages = [
  "assets/images/morning/day-1.jpg",
  "assets/images/morning/day-2.jpg",
  "assets/images/morning/day-3.jpg",
  "assets/images/morning/day-4.jpg"
];

var eveningImages = [
  "assets/images/evening/ev-1.jpg",
  "assets/images/evening/ev-2.jpg",
  "assets/images/evening/ev-3.jpg",
  "assets/images/evening/ev-4.jpg",
  "assets/images/evening/ev-5.jpg",
  "assets/images/evening/ev-6.jpg",
  "assets/images/evening/ev-7.jpg",
  "assets/images/evening/ev-8.jpg",
];

var nightImages = [
  "assets/images/night/night-1.jpg",
  "assets/images/night/night-2.jpg",
  "assets/images/night/night-3.jpg",
  "assets/images/night/night-4.jpg",
  "assets/images/night/night-5.jpg",
];

String img(images) {
  int min = 0;
  int max = images.length - 1;
  Random rnd = new Random();
  int r = min + rnd.nextInt(max - min);
  String imageName = images[r];
  return (imageName);
}

Widget Dates(int hr) {
  hr = 10;
  if (hr >= 6 && hr < 18)
    return MorningPage();
  else if (hr == 5 || (hr >= 18 && hr <= 19))
    return EveningPage();
  else
    return NightPage();
}
