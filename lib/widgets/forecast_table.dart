import 'package:flutter/material.dart';
import '../values/MyTextStyles.dart';
import 'package:intl/intl.dart';

class ForecastTable extends StatelessWidget {
  final List days;
  ForecastTable({this.days});
  @override
  Widget build(BuildContext context) {
    var i = -1;
    return Column(
      children: <Widget>[
        Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Text('Date', style: MyTextStyles.bodyTextwhite)),
                  Expanded(
                      flex: 2,
                      child: FittedBox(
                          child: Text('MinTemp ',
                              style: MyTextStyles.bodyTextwhite))),
                  Expanded(
                      flex: 2,
                      child: FittedBox(
                          child: Text(' MaxTemp',
                              style: MyTextStyles.bodyTextwhite))),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Weather',
                        style: MyTextStyles.bodyTextwhite,
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
                            .format(DateTime.now().add(Duration(days: i)))
                            .substring(0, 3),
                        style: MyTextStyles.bodyText2),
                    SizedBox(width: 5.0),
                    Expanded(
                        flex: 2,
                        child:
                            Text(days[i]['date'], style: MyTextStyles.bodyText2)),
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
        }).toList()),
      ],
    );
  }
}
