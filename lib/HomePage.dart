import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'services/ApiCall.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'values/MyBackgrounds.dart';
import 'values/MyColors.dart';
import 'values/MyTextStyles.dart';
import 'widgets/Animation.dart';
import 'widgets/navDrawer.dart';
import 'widgets/SearchBar.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool internet = true;

  _checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setState(() {
        internet = false;
      });
    } else {
      setState(() {
        internet = true;
      });
      await SearchBar.getCities();
      print("done");
    }
  }

  @override
  void initState() {
    _checkInternet();
    super.initState();
  }

  int index = 1;
  //List<List> cities;
  @override
  Widget build(BuildContext context) {
    int hour = int.parse(TimeOfDay.now().toString().substring(10, 12));
    int bg = backgournd(hour);
    List images;
    Color text;
    if (bg == 0) {
      images = BackgroundImage.morningImages;
      text = MyColors.morning;
    } else if (bg == 1) {
      images = BackgroundImage.nightImages;
      text = MyColors.color1;
    } else {
      images = BackgroundImage.eveningImages;
      text = MyColors.color1;
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(image: AssetImage(images[index]), fit: BoxFit.cover),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                title: Text("IMD Weather", style: TextStyle(color: text)),
                centerTitle: true,
                backgroundColor: Color(0xffFBFCFC).withOpacity(0.25),
                iconTheme: new IconThemeData(color: text),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // _showSnackbar('Coming Soon');
                          showSearch(context: context, delegate: SearchBar());
                        },
                        child: Icon(
                          Icons.search,
                        ),
                      )),
                ]),
            drawer: NavDrawer(),
            body: RefreshIndicator(
                child: SafeArea(
                    child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: FadeAnimation(
                            delay: 1.0,
                            child: Padding(
                              //padding used for text mumbai
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text("Mumbai",
                                  style: TextStyle(
                                    color: text,
                                    fontSize: 38.0,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 2.0,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        FadeAnimation(
                          delay: 1.2,
                          child: Text(
                            DateFormat('h:mm a E, d MMM y')
                                .format(DateTime.now()),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: text),
                          ),
                        ),
                        SizedBox(height: 35.0),
                        !internet
                            ? Text("No Internet")
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    child: FadeAnimation(
                                      delay: 1.4,
                                      child: Stack(
                                        children: <Widget>[
                                          Text("22",
                                              style: TextStyle(
                                                color: text,
                                                fontSize: 55.0,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 1.0,
                                              )),
                                          Positioned(
                                              left: 50.0,
                                              bottom: 20.0,
                                              child: Icon(
                                                  WeatherIcons.wi_celsius,
                                                  size: 70,
                                                  color: text))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  FadeAnimation(
                                    delay: 1.6,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Feather.sun,
                                          size: 35.0,
                                          color: Colors.orangeAccent,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text('Sunny',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28.0,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 150.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, right: 0.0),
                                    child: FadeAnimation(
                                      delay: 1.8,
                                      child: Card(
                                        color: MyColors.transparent
                                            .withOpacity(0.25),
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: <Widget>[
                                              WRH_Column(
                                                  value: 5,
                                                  unit: 'km/h',
                                                  parameter: 'Wind',
                                                  icon: Feather.wind),
                                              WRH_Column(
                                                  value: 70,
                                                  unit: '%',
                                                  parameter: 'Rain',
                                                  icon: Feather.cloud_drizzle),
                                              WRH_Column(
                                                  value: 60,
                                                  unit: '%',
                                                  parameter: 'Humidity',
                                                  icon:
                                                      WeatherIcons.wi_humidity)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 70.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, right: 0.0),
                                    child: FadeAnimation(
                                      delay: 2.0,
                                      child: Card(
                                        color: MyColors.colorgreen,
                                        elevation: 5.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                    "Today's Weather Info.",
                                                    style: MyTextStyles.Today),
                                              ),
                                              SizedBox(height: 7.0),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                child: Divider(
                                                  height: 3.0,
                                                  color: MyColors.tp3,
                                                  thickness: 2,
                                                ),
                                              ),
                                              SizedBox(height: 1.0),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
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
                                                          const EdgeInsets.only(
                                                              right: 23.0),
                                                      child: Icon(
                                                        Icons.wb_sunny,
                                                        color:
                                                            Colors.orangeAccent,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        DateFormat('E, d MMM ')
                                                            .format(
                                                                DateTime.now()),
                                                        style: MyTextStyles
                                                            .DateText,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "22°C",
                                                          style: MyTextStyles
                                                              .DateText,
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "32°C",
                                                          style: MyTextStyles
                                                              .DateText,
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 22.0),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
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
                                                      child: Text(
                                                          "Percipitation ",
                                                          style: MyTextStyles
                                                              .DetailHead)),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "70%",
                                                        style: MyTextStyles
                                                            .DetailsValue,
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text("Wind",
                                                          style: MyTextStyles
                                                              .DetailHead)),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text("8 km/h",
                                                          style: MyTextStyles
                                                              .DetailsValue)),
                                                ],
                                              ),
                                              SizedBox(height: 25.0),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      flex: 4,
                                                      child: Text(
                                                        "Pressure",
                                                        style: MyTextStyles
                                                            .DetailHead,
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text("940hPa",
                                                          style: MyTextStyles
                                                              .DetailsValue)),
                                                  Expanded(
                                                      flex: 4,
                                                      child: Text("Humidity ",
                                                          style: MyTextStyles
                                                              .DetailHead)),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text("65%",
                                                          style: MyTextStyles
                                                              .DetailsValue)),
                                                ],
                                              ),
                                              SizedBox(height: 30.0),
                                            ],
                                          ),
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
                                ],
                              ),
                        SizedBox(height: 100.0),
                      ],
                    ),
                  ),
                )),
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 1));
                  await _checkInternet();
                  if (internet) {
                    setState(() {
                      index = Random().nextInt(images.length - 1);
                    });
                  }
                })),
      ],
    );
  }

  // Future<void> getCities() async {
  //   CityData cityData = new CityData();
  //   await cityData.getIDs();
  //   cities = [cityData.id, cityData.city];
  // }

  int backgournd(int hr) {
    hr = 10;
    if (hr >= 6 && hr < 18)
      return 0; //Morning
    else if (hr == 5 || (hr >= 18 && hr <= 19))
      return 2; //Evening
    else
      return 1; //Night
  }
}

class WRH_Column extends StatelessWidget {
  final IconData icon;
  final int value;
  final String unit;
  final String parameter;
  const WRH_Column({Key key, this.icon, this.value, this.unit, this.parameter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '$value',
                  style: MyTextStyles.WPHData,
                  children: [
                    TextSpan(text: ' $unit', style: MyTextStyles.bodyTextwhite)
                  ],
                )),
            SizedBox(height: 20),
            FittedBox(
              child: Text('$parameter',
                  textAlign: TextAlign.center, style: MyTextStyles.WPHText),
            )
          ]),
    );
  }
}
