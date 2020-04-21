import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'services/ApiCall.dart';
import 'MyTextStyles.dart';

class LocationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var i = -1;
    final Map data = ModalRoute.of(context).settings.arguments;
    final String location = data['location'];
    final List days = data['days'];
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Image(
        image: AssetImage('assets/images/clear_sky.jpeg'),
        fit: BoxFit.cover,
      ),
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
              Column(
                  children: days.map((index) {
                i++;
                return Card(
                    color: Color(0x11b3c6e4),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                              DateFormat.E()
                                  .format(DateTime.now()
                                      .subtract(Duration(days: i)))
                                  .substring(0, 3),
                              style: MyTextStyles.bodyText2),
                          SizedBox(width: 5.0),
                          Expanded(
                              flex: 2,
                              child: Text(days[i]['date'],
                                  style: MyTextStyles.bodyText2)),
                          Expanded(
                              flex: 2,
                              child: Text('${days[i]['minTemp']}°C',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.bodyText2)),
                          Expanded(
                              flex: 2,
                              child: Text('${days[i]['maxTemp']}°C',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.bodyText2)),
                          Expanded(
                              flex: 3,
                              child: Text(days[i]['weather'],
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.bodyText2)),
                        ],
                      ),
                    ));
              }).toList())
            ],
          ),
        )),
      )
    ]));
  }
}
