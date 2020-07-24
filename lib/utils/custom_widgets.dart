import 'package:calculationdairy/utils/const/color_const.dart';
import 'package:calculationdairy/utils/const/image_const.dart';
import 'package:flutter/material.dart';
class CustomeDialogBox extends StatefulWidget {
  String message;
  CustomeDialogBox(this.message);
  @override
  _CustomeDialogBoxState createState() => _CustomeDialogBoxState();
}

class _CustomeDialogBoxState extends State<CustomeDialogBox> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.linearToEaseOut);

    controller.addListener(() {
      setState(() {});
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
    return  Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                height:MediaQuery.of(context).size.height/2.5,
                width: MediaQuery.of(context).size.width/1.5,
                child: Column(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/5-36,
                      width:MediaQuery.of(context).size.width/1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                        color: Colors.redAccent,

                      ),
                      child: Center(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(sadFace,scale: 1.2,),
                            Text("Oh , No!",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Popins',fontWeight: FontWeight.w600),textAlign: TextAlign.center,),

                          ],
                        )
                      ),

                    ),
                    Container(
                      height:MediaQuery.of(context).size.height/5+36,
                      width:MediaQuery.of(context).size.width/1.5 ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        color: Colors.white,

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Container(
                            width:MediaQuery.of(context).size.width/1.5 ,
                            height:MediaQuery.of(context).size.height/5-7 ,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Text(widget.message,style: TextStyle(fontSize: 18,color: Colors.black54),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                color: Colors.lightBlue,

                              ),
                              height: 42,
                              child: Center(
                                child: Text("OK",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Popins',fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                              ),
                            ),
                          )
                        ],
                      ),



                    ),

                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
