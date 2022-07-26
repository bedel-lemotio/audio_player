import 'dart:io';

import 'package:audio_player/core/di/components/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../core/stores/music/music_store.dart';
import 'now_playing.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeView> with TickerProviderStateMixin {
  final List<MaterialColor> _colors = Colors.primaries;

  final MusicStore _musicStore = getIt<MusicStore>();

  @override
  void initState() {
    _musicStore.loadSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appThemeColor,
      appBar: AppBar(
        title: Text("LBMusic Player"),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: InkWell(
                  child: Text("Now Playing"),
                  onTap: () {
                    if (_musicStore.listSongs != null &&
                        _musicStore.listSongs.isNotEmpty) {
                      goToNowPlaying(
                        _musicStore.listSongs[_musicStore.currentIndex < 0
                            ? 0
                            : _musicStore.currentIndex],
                        nowPlayTap: true,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("No song load"),
                      ));
                    }
                  }),
            ),
          )
        ],
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            if (_musicStore.listSongs != null &&
                _musicStore.listSongs.isNotEmpty) {
              return Scrollbar(
                child: ListView.builder(
                  itemCount: _musicStore.listSongs.length,
                  itemBuilder: (_, index) {
                    SongModel song = _musicStore.listSongs[index];
                    final MaterialColor color = _colors[index % _colors.length];
                    return ListTile(
                      dense: false,
                      leading: Hero(
                          tag: song.title,
                          child: QueryArtworkWidget(
                            id: _musicStore.listSongs[index].id,
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: CircleAvatar(
                              backgroundColor: color,
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                            errorBuilder: (context, _, __) {
                              return CircleAvatar(
                                backgroundColor: color,
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              );
                            },
                            artworkRepeat: ImageRepeat.noRepeat,
                            artworkFit: BoxFit.cover,
                          )),
                      title: Text(song.title),
                      subtitle: Text(
                        "${song.artist ?? '<Unknown>'}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      minLeadingWidth: 60,
                      onTap: () {
                        if (_musicStore.listSongs != null &&
                            _musicStore.listSongs.isNotEmpty) {
                          print(song.uri!);
                          _musicStore.playFromHome(index, song.data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NowPlaying(song)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("No song load"),
                          ));
                        }
                      },
                    );
                  },
                ),
              );
            }

            if (_musicStore.listSongs != null &&
                _musicStore.listSongs.isEmpty) {
              return Center(
                child: const Text("Nothing found!"),
              );
            }

            return Center(
              child: SpinKitFadingCube(
                color: AppColors.appThemeColor,
                size: 50.0,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shuffle),
          onPressed: () {
            if (_musicStore.listSongs != null &&
                _musicStore.listSongs.isNotEmpty) {
              shuffleSongs();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("No song load"),
              ));
            }
          }),
    );
  }

  //Goto Now Playing Page
  void goToNowPlaying(SongModel song, {bool nowPlayTap: false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NowPlaying(
                  song,
                  nowPlayTap: nowPlayTap,
                )));
  }

  //Shuffle Songs and goto now playing page
  void shuffleSongs() {
    goToNowPlaying(_musicStore.randomSong!);
  }
}
