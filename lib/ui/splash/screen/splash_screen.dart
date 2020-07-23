import 'dart:async';

import 'package:calculationdairy/base/dependancyInjection/locator.dart';
import 'package:calculationdairy/base/navigationutils/navaigation_route.dart';
import 'package:calculationdairy/base/navigationutils/navigation_constant.dart';
import 'package:calculationdairy/utils/const/color_const.dart';
import 'package:calculationdairy/utils/const/image_const.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  FadeIn createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> with TickerProviderStateMixin{
  double scanle=1;
  Widget value= Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset(splashImage,scale: 2,),
      Text("Calculation dairy",style: TextStyle(fontSize: 18,color: Colors.white),)
    ],
  );


  var valueAfterAnim=Image.asset(splashImage,scale: 5,);



  _startTime(BuildContext context) async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, () async {

        _gotoNextScreen();

    });
  }

  AnimationController _controller;
  Animation<double> _animation;

  _gotoNextScreen(){
    locator<NavigationRoutes>().pushReplacement(context, routeLogin);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.forward();

    Future.delayed(Duration(seconds: 0), () async {
      _startTime(context);
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: primaryColors,
          body: Center(
            child: ScaleTransition(
                scale: _animation,
                alignment: Alignment.center,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      value
                    ]
                )
            ),
          )

      ),
    );
  }
}

