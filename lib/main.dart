import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'base/dependancyInjection/locator.dart';
import 'base/navigationutils/navaigation_route.dart';
import 'base/navigationutils/navigation_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(CalculationDairy());
}

class CalculationDairy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      initialRoute: routeLaunch,
      onGenerateRoute: locator<NavigationRoutes>().generateRoute,
      title: "Calculation Dairy",

    );
  }
}



