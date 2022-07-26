

import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../ui/shared/widgets/snackbar.dart';
import '../error/error_store.dart';

part 'music_store.g.dart';

@singleton
class MusicStore = _MusicStore with _$MusicStore;

abstract class _MusicStore with Store {

  // disposers
  List<ReactionDisposer>? _disposers;

  final ErrorStore errorStore;

  final OnAudioQuery query = OnAudioQuery();

  final AudioPlayer player;


  // constructor:---------------------------------------------------------------

  _MusicStore({required this.errorStore,required this.player}) {

    init();

    _disposers = [

    ];
  }

  @observable
  bool isMuted = false;

  @observable
  bool _hasPermission = false;

  @observable
  bool _hasError = false;

  @observable
  int _currentSongIndex = -1;

  @observable
  List<SongModel> listSongs = [];

  @computed
  bool get hasPermission => _hasPermission;

  @computed
  bool get hasError => _hasError;

  @computed
  int get length => listSongs.length;

  @computed
  int get songNumber => _currentSongIndex + 1;

  int get currentIndex => _currentSongIndex;

  SongModel? get currentSong => listSongs[currentIndex];
  String? get currentSongTitle => listSongs[currentIndex].title;
  String? get currentSongArtist => listSongs[currentIndex].artist;

  @computed
  bool get isPlaying => player == PlayerState.playing;

  @computed
  bool get isPaused => player == PlayerState.paused;

  @computed
  bool get isStopped => player == PlayerState.stopped;



  SongModel? get nextSong {
    if (_currentSongIndex < length) {
      _currentSongIndex++;
    }
    if (_currentSongIndex >= length) return null;
    return listSongs[_currentSongIndex];
  }

  SongModel? get randomSong {
    Random r =  Random();
    return listSongs[r.nextInt(listSongs.length)];
  }

  SongModel? get prevSong {
    if (_currentSongIndex > 0) {
      _currentSongIndex--;
    }
    if (_currentSongIndex < 0) return null;
    return listSongs[_currentSongIndex];
  }


  // Function :-----------------------------------------------------------------


  Future<void> play() async {
    await player.resume();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }

  Future next() async {
    final t = nextSong;
    if (t != null) {
      await player.play(DeviceFileSource(t.data));
    }

  }

  Future prev() async {
    final t = prevSong;
    if (t != null) {
      await player.play(DeviceFileSource(t.data));
    }
  }

  Future setMute(bool mute) async {
    if (mute) {
      await player.setVolume(0.5);
      isMuted = mute;
    } else {
      await player.setVolume(0);
      isMuted = mute;
    }
  }

  void setCurrentIndex(int index) {
    _currentSongIndex = index;
  }

  Future loadSongs() async {

    final future = query.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );

    future.then((response) {
      listSongs = response;
    }).catchError((error) {
      print(error);
    });
  }

  void init() async {
    // Check if the plugin has permission to read the library.
    try {
      _hasPermission = await query.permissionsStatus();

      if(_hasPermission == false){

        await [
          Permission.storage,
          Permission.mediaLibrary,
        ].request();

      }else{
      }

    } on UnimplementedError {
      _hasError = true;

      // Some went wrong.
    } catch (e) {
      _hasPermission = false;
    }
  }

  void playFromHome(int index ,String uri) async {
    setCurrentIndex(index);
    await player.play(DeviceFileSource(uri));
    // final bytes = await AudioCache.instance.loadAsBytes(uri);
    // await player.play(BytesSource(bytes));
  }


  // Dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers!) {
      d();
    }
  }

  Function() requestPermission(BuildContext context) {
    return () async {
      bool statusPermission = hasPermission ? hasPermission : await query.permissionsRequest();

      SnackBar snackBar = SnackBarWidget(
        context: context,
        status: statusPermission
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    };
  }

}
