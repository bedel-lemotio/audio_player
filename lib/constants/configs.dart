
import 'package:audio_player/core/di/components/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart' as path_provider;



class Configs {

  Configs._();

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPreferredOrientations();
    configureInjection();
  }


  static Future<void> setPreferredOrientations() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }







}
