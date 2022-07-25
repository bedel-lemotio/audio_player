import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../di/components/injection.dart';
import '../error/error_store.dart';


part 'theme_store.g.dart';

@singleton
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final String TAG = "_ThemeStore";


  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------
  @observable
  bool _darkMode = false;

  // getters:-------------------------------------------------------------------
  bool get darkMode => _darkMode;

  // constructor:---------------------------------------------------------------
  _ThemeStore() {
    //init();
  }

  // actions:-------------------------------------------------------------------
  // @action
  // Future changeBrightnessToDark(bool value) async {
  //   _darkMode = value;
  //   await repository.changeBrightnessToDark(value);
  // }
  //
  // // general methods:-----------------------------------------------------------
  // Future init() async {
  //   _darkMode = await repository.isDarkMode ;
  // }

  bool isPlatformDark(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.dark;

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
