import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_constanst.dart';

class HiveManeger {

  HiveManeger(){
    initHive();
  }
  Future<Box<dynamic>> initHive() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }

//  if (kIsWeb) {
//    await Hive.openBox(APP_NAME);
//  } else {
//    var dir = await getApplicationDocumentsDirectory();
//    Hive.init(dir.path);
//  }

    return await Hive.openBox(boxName);
  }

  Box<dynamic> _openBox() {
    return Hive.box(boxName);
  }

//String values
  putValue(String key, dynamic value) {
    _openBox().put(key, value);
  }

  String getStringValue(String key, String value) {
    String result = _openBox().get(key);
    if (result == null) {
      return value;
    } else {
      return result;
    }
  }

//Boolean values

  bool getBoolValue(String key) {
    bool result = _openBox().get(key);
    if (result == null) {
      return false;
    } else {
      return result;
    }
  }

//Integer values

  int getIntValue(String key) {
    int result = _openBox().get(key);
    if (result == null) {
      return 0;
    } else {
      return result;
    }
  }

//Double values

  double getDoubleValue(String key) {
    double result = _openBox().get(key);
    if (result == null) {
      return 0;
    } else {
      return result;
    }
  }

  List getListValue(String key) {
    List result = _openBox().get(key);
    if (result == null) {
      return List();
    } else {
      return result;
    }
  }
}
