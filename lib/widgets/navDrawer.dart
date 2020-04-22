import 'package:flutter/material.dart';
import '../values/MyColors.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: Container(
              color: MyColors.bg,
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      child: Image.asset('assets/images/imd_logo.png')),
                  Text(
                    'Indian Meteorological department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: MyColors.text1),
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    color: MyColors.text1,
                    child: ListTile(
                      title: Text("Mumbai",
                          style: TextStyle(color: MyColors.text2)),
                      trailing:
                          Icon(Icons.arrow_forward, color: MyColors.text2),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/loading',
                            arguments: {'location': 'Mumbai'});
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}