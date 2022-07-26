import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';




@module
abstract class PlayerInjectableModule {
  @lazySingleton
  AudioPlayer get player => AudioPlayer();
}
