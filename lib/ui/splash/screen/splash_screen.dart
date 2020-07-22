import 'dart:async';

import 'package:calculationdairy/utils/const/color_const.dart';
import 'package:calculationdairy/utils/const/image_const.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  FadeIn createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> with TickerProviderStateMixin{
  Timer _timer;
  double scanle=1;
  Widget value=
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Image.asset(splashImage,scale: 2,),
      Text("Calculation dairy",style: TextStyle(fontSize: 18,color: Colors.white),)
    ],
  );

  var valueAfterAnim=Image.asset(splashImage,scale: 5,);



  AnimationController _controller;
  Animation<double> _animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.forward();
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

