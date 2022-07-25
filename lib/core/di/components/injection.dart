import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:audio_player/core/di/components/injection.config.dart';



final getIt = GetIt.instance;

@InjectableInit()
void configureInjection()  => $initGetIt(getIt);
