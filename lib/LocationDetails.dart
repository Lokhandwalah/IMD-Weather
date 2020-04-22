import 'package:flutter/material.dart';
import 'widgets/forecast_table.dart';
import 'package:intl/intl.dart';
import 'values/MyTextStyles.dart';

class LocationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    final String location = data['location'];
    final List days = data['days'];
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Image(
        image: AssetImage('assets/images/clear_sky.jpeg'),
        fit: BoxFit.cover,
      ),
      SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Text(location, style: Theme.of(context).textTheme.title),
            ),
            SizedBox(height: 20.0),
            Text(DateFormat('h:mm a E, d MMM y').format(DateTime.now()),
                style: MyTextStyles.bodyText),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Text('Forecast ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text('Date', style: MyTextStyles.bodyText)),
                  Expanded(
                      flex: 2,
                      child: FittedBox(
                          child: Text('MinTemp ',
                              style: MyTextStyles.bodyText))),
                  Expanded(
                      flex: 2,
                      child: FittedBox(
                          child: Text(' MaxTemp',
                              style: MyTextStyles.bodyText))),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Weather',
                        style: MyTextStyles.bodyText,
                        textAlign: TextAlign.end,
                      )),
                ],
              ),
            ),
            ForecastTable(days: days)
          ],
        ),
      )),
    ]));
  }
}
