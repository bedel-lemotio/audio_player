// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:audioplayers/audioplayers.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../stores/error/error_store.dart' as _i4;
import '../../stores/music/music_store.dart' as _i5;
import '../../stores/theme/theme_store.dart' as _i6;
import '../modules/player_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final playerInjectableModule = _$PlayerInjectableModule();
  gh.lazySingleton<_i3.AudioPlayer>(() => playerInjectableModule.player);
  gh.singleton<_i4.ErrorStore>(_i4.ErrorStore());
  gh.singleton<_i5.MusicStore>(_i5.MusicStore(
      errorStore: get<_i4.ErrorStore>(), player: get<_i3.AudioPlayer>()));
  gh.singleton<_i6.ThemeStore>(_i6.ThemeStore());
  return get;
}

class _$PlayerInjectableModule extends _i7.PlayerInjectableModule {}
