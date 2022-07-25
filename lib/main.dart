import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'constants/configs.dart';




void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

Future<void> main() async {
  await Configs.initApp();
  runZonedGuarded(() {
    runApp(AppAudioPlayer());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
  });
}

