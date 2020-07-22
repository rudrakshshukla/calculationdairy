import 'package:calculationdairy/base/navigationutils/navigation_constant.dart';
import 'package:calculationdairy/ui/auth/screen/login_screeen.dart';
import 'package:calculationdairy/ui/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class NavigationRoutes{

  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case routeLaunch:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return _errorRoute(" Comming soon...");
    }
  }



   Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(child: Text(message)));
    });
  }

   void pushReplacement(BuildContext context, String routeName,
      {Object arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

   Future<dynamic> push(BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

   Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

}