import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/di/components/injection.dart';
import '../../../../core/stores/music/music_store.dart';
import '../../../shared/widgets/mp_control_button.dart';



class PlayerWidget extends StatefulWidget {
  PlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {

  final MusicStore _musicStore = getIt<MusicStore>();
  PlayerState? _audioPlayerState;
  Duration? _duration;
  Duration? _position;


  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;


  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';





  @override
  void initState() {
    super.initState();
    _initStreams();
  }



  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ControlButton(Icons.skip_previous, () => _musicStore.prev()),

            Observer(
              builder: (context) {
                if (_musicStore.statutPlayer) {
                  return ControlButton(Icons.play_arrow ,() => _musicStore.play());
                }
                return ControlButton(Icons.pause ,() => _musicStore.pause());

              },
            ),


            // ControlButton(Icons.stop ,() => _musicStore.isStopped ? null : _musicStore.stop()),
            ControlButton(Icons.skip_next, () => _musicStore.next()),
          ],
        ),
        Slider(
          onChanged: (v) {
            final duration = _duration;
            if (duration == null) {
              return;
            }
            final position = v * duration.inMilliseconds;
            _musicStore.player.seek(Duration(milliseconds: position.round()));
          },
          value: (_position != null &&
                  _duration != null &&
                  _position!.inMilliseconds > 0 &&
                  _position!.inMilliseconds < _duration!.inMilliseconds)
              ? _position!.inMilliseconds / _duration!.inMilliseconds
              : 0.0,
        ),
        Text(
            _position != null
                ? "${_positionText} / ${_durationText}"
                : _duration != null ? _durationText : '',
            style: const TextStyle(fontSize: 24.0))
      ],
    );
  }

  void _initStreams() {
    _durationSubscription = _musicStore.player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = _musicStore.player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = _musicStore.player.onPlayerComplete.listen((event) {
      _musicStore.stop();
      setState(() {
        _position = _duration;
      });
    });

    _playerStateChangeSubscription = _musicStore.player.onPlayerStateChanged.listen((state) {
      setState(() {
        _audioPlayerState = state;
      });
    });
  }





}
