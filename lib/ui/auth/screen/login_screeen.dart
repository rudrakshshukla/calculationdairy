import 'package:calculationdairy/base/animationutils/FadeIn.dart';
import 'package:calculationdairy/base/dependancyInjection/locator.dart';
import 'package:calculationdairy/base/hiveutils/hive_constanst.dart';
import 'package:calculationdairy/base/hiveutils/hive_maneger.dart';
import 'package:calculationdairy/base/hiveutils/hiveobjects/user_model.dart';
import 'package:calculationdairy/utils/const/color_const.dart';
import 'package:calculationdairy/utils/const/image_const.dart';
import 'package:calculationdairy/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userName=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColors
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(delay:0.8,child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(splashImage,scale: 3,),
                        Text("Calculation dairy",style: TextStyle(fontSize: 30,color: Colors.white),)
                      ],
                    ) ,),
                    SizedBox(height: 10,),
                    FadeAnimation(delay:1.3,child: Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: FadeAnimation(delay: 2.2,child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(splashImage,scale: 2,),
                            ],
                          ),),
                        ),
                        SizedBox(height: 12,),
                        FadeAnimation(delay:2, child:Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: _userName,
                                  decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextField(
                                  controller: _password,

                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        SizedBox(height: 40,),
                        FadeAnimation(delay:2.2, child:
                        InkWell(
                          onTap: ()  {

                            var value = locator<HiveManeger>().getStringValue(_userName.text,"");
                            if(value!="")
                              {
                               if(_password==value)
                                 {

                                 }
                               else{
                                 showDialog(
                                   context: context,
                                   builder: (_) => CustomeDialogBox( "User id or password is wrong, please try again"),
                                 );
                               }
                              }
                            else{
                              showDialog(
                                context: context,
                                builder: (_) => CustomeDialogBox(" User id or password is wrong, please try again"),
                              );
                            }


                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: primaryColors
                            ),
                            child: Center(
                              child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
