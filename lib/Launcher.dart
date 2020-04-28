import 'package:flutter/material.dart';
import 'values/MyColors.dart';

class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/imd_logo.png')),
              SizedBox(height: 10.0),
              Expanded(
                  child: Text('Indian Meteorological Department',
                      textAlign: TextAlign.center,
                      style: TextStyle( color: Colors.white,
                          fontSize: 25.0, fontWeight: FontWeight.w500)))
            ],
          ),
        ),
      ),
    );
  }
}
