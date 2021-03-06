import 'package:flutter/material.dart';
import '../values/MyColors.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColors.text1,
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Image.asset('assets/images/imd_logo.png')),
            Text(
              'Indian Meteorological department',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                  color: MyColors.color1),
            ),
            SizedBox(height: 20.0),
            DrawerItem(title: 'Mumbai', route: '/location', args: {'location': 'Mumbai'}),
            DrawerItem(title: 'Warnings', route: '/warnings'),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String route;
  final Map args;
  const DrawerItem({
    Key key,
    @required this.title,
    @required this.route,
    this.args
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.text1,
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 20.0, color: MyColors.color1)),
        trailing: Icon(Icons.arrow_forward, color: MyColors.color1),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, route,
              arguments: args);
        },
      ),
    );
  }
}
