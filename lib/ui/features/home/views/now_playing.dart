import 'dart:async';
import 'package:audio_player/constants/strings.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../core/di/components/injection.dart';
import '../../../../core/stores/music/music_store.dart';
import '../../../shared/widgets/mp_album_ui.dart';
import '../../../shared/widgets/mp_blur_filter.dart';
import '../../../shared/widgets/mp_blur_widget.dart';
import '../widgets/player_widget.dart';


class NowPlaying extends StatefulWidget {
  final SongModel song;
  final bool? nowPlayTap;
  const NowPlaying(this.song, {this.nowPlayTap});

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  final MusicStore _musicStore = getIt<MusicStore>();

  bool isMuted = false;

  @override
  initState() {
    super.initState();

  }



  
  @override
  Widget build(BuildContext context) {



    Future mute(bool muted) async {

    }



    Widget _buildPlayer() => Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Column(
            children: <Widget>[
              Observer(
                builder: (context) {
                  return Text(
                    _musicStore.currentSongTitle?? Strings.unknownMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return Text(
                    _musicStore.currentSongTitle?? Strings.unknownMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  );
                },
              ),


              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
              )
            ],
          ),

          PlayerWidget(),
          
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: isMuted
                      ? Icon(
                    Icons.headset,
                    color: Theme.of(context).unselectedWidgetColor,
                  )
                      : Icon(Icons.headset_off,
                      color: Theme.of(context).unselectedWidgetColor),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    mute(!isMuted);
                  }),
            ],
          ),
        ]));


    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            blurWidget(widget.song,_musicStore),
            blurFilter(),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AlbumUI(widget.song, Duration(minutes: widget.song.duration!), Duration(minutes:10)),
                  Material(
                    color: Colors.transparent,
                    child: _buildPlayer(),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}