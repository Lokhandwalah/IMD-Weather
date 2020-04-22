import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'services/ApiCall.dart';
import 'widgets/forecast_table.dart';
import 'package:intl/intl.dart';
import 'values/MyTextStyles.dart';
import 'values/MyColors.dart';

class LocationDetails extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  bool flag = false;
  Forecast forecast = new Forecast();
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    final String location = data['location'];

    Widget grid() {
      return ListView.builder(
          itemCount: forecast.regions.length,
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/region', arguments: {
                    'days': forecast.forecasts[index],
                    'region': forecast.regions[index]
                  });
                },
                child: ListTile(
                    title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    '${forecast.regions[index]}',
                    style: MyTextStyles.bodyTextwhite,
                  ),
                )),
              ),
              color: Colors.blue[200 + (index * 100)],
            );
          });
    }

    void fetch() async {
      await forecast.getForecast(location);
      setState(() {
        flag = true;
      });
    }

    Widget spinner() {
      fetch();
      return SpinKitCircle(
        color: MyColors.color1,
        size: 80.0,
      );
    }

    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Image(
        image: AssetImage('assets/images/clear_sky.jpeg'),
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 50.0),
        child: Text('Mumbai', style: MyTextStyles.title),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: flag ? grid() : spinner())
    ]));
  }
}
