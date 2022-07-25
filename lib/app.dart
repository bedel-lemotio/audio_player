import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'core/di/components/injection.dart';
import 'core/stores/music/music_store.dart';
import 'core/stores/theme/theme_store.dart';
import 'core/router/route_generator.dart';
import 'ui/features/splash/splash_screen.dart';

class AppAudioPlayer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ThemeStore _themeStore = getIt<ThemeStore>();
    final MusicStore _musicStore = getIt<MusicStore>();

    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.android) {
      return MultiProvider(
        providers: [
          Provider<ThemeStore>(create: (_) => _themeStore),
          Provider<MusicStore>(create: (_) => _musicStore),
        ],
        child: Observer(
          builder: (context) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            return MaterialApp(
              title: Strings.appName,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [],
              theme: AppThemes.themeDataDark,
              onGenerateRoute: RouteGenerator.generateRoute,
              home:  SplashScreen(),
            );
          },
        ),
      );
    } else if (platform == TargetPlatform.iOS) {
      return MultiProvider(
        providers: [
          Provider<ThemeStore>(create: (_) => _themeStore),
          Provider<MusicStore>(create: (_) => _musicStore),
        ],
        child: MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [],
          theme:AppThemes.themeDataDark,
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashScreen(),
        ),
      );
    } else
      throw UnsupportedError('Only Android and iOS are supported.');
  }
}



