

import 'package:calculationdairy/base/navigationutils/navaigation_route.dart';
import 'package:calculationdairy/base/sharedprefrence/shared_prefrence_utils.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  PreferenceUtils prefs = await PreferenceUtils.getInstance();

  locator.registerSingleton<PreferenceUtils>(prefs,
      instanceName: 'SharedPreferencesUtils');

  locator.registerSingleton<NavigationRoutes>(NavigationRoutes());


}