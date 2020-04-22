import 'package:flutter/material.dart';
import 'package:imd_weather/widgets/navDrawer.dart';
import 'package:intl/intl.dart';
import 'values/MyColors.dart';
import 'values/MyTextStyles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scafflodKey = new GlobalKey<ScaffoldState>();
  void _showSnackbar(String s) {
    _scafflodKey.currentState.showSnackBar(SnackBar(
      content: Text(s),
      duration: Duration(seconds: 1),
    ));
  }

  static List<String> images = [
    'assets/images/clear_sky.jpeg',
    'assets/images/evening_sky.jpeg',
    'assets/images/night_sky.jpeg'
  ];
  String bg = images[0];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Image(
        image: AssetImage(bg),
        fit: BoxFit.cover,
      ),
      Scaffold(
          key: _scafflodKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title:
                  Text("IMD Weather", style: TextStyle(color: index==0 ? MyColors.text1 : MyColors.color1)),
              centerTitle: true,
              backgroundColor: Color(0xffFBFCFC).withOpacity(0.25),
              iconTheme: new IconThemeData(color: index==0 ? MyColors.text1 : MyColors.color1),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        _showSnackbar('Coming Soon');
                      },
                      child: Icon(
                        Icons.add,
                      ),
                    )),
              ]),
          drawer: NavDrawer(),
          body: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  if (index < images.length - 1)
                    index++;
                  else
                    index = 0;
                  bg = images[index];
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    Text('Mumbai', style: index==0 ? MyTextStyles.title : MyTextStyles.titlewhite),
                    SizedBox(height: 20.0),
                    Text(DateFormat('h:mm a E, d MMM y').format(DateTime.now()),
                        style: index==0 ? MyTextStyles.bodyText : MyTextStyles.bodyTextwhite),
                    SizedBox(height: 20.0),
                  ],
                ),
              )))
    ]);
  }
}
