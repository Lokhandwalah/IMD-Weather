import 'package:flutter/material.dart';
import '../services/ApiCall.dart';
import '../MyColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String location;
  void setupForecast(location) async {
    try{
      Forecast forecast = new Forecast();
    await forecast.getForecast(location);
    Navigator.pushReplacementNamed(context, '/location', arguments: {
     'location': location,
     'days': forecast.days
    });
    }
    catch (e) {
      print('Error Occured: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    setupForecast(data['location']);
    return Scaffold(
        backgroundColor: MyColors.bg,
        body: Center(
            child: SpinKitRing(
          color: MyColors.text2,
          size: 80.0,
        )));
  }
}
