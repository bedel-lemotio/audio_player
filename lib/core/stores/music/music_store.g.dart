// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicStore on _MusicStore, Store {
  Computed<bool>? _$hasPermissionComputed;

  @override
  bool get hasPermission =>
      (_$hasPermissionComputed ??= Computed<bool>(() => super.hasPermission,
              name: '_MusicStore.hasPermission'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_MusicStore.hasError'))
      .value;
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??=
          Computed<int>(() => super.length, name: '_MusicStore.length'))
      .value;
  Computed<int>? _$songNumberComputed;

  @override
  int get songNumber => (_$songNumberComputed ??=
          Computed<int>(() => super.songNumber, name: '_MusicStore.songNumber'))
      .value;
  Computed<bool>? _$isPlayingComputed;

  @override
  bool get isPlaying => (_$isPlayingComputed ??=
          Computed<bool>(() => super.isPlaying, name: '_MusicStore.isPlaying'))
      .value;
  Computed<bool>? _$isPausedComputed;

  @override
  bool get isPaused => (_$isPausedComputed ??=
          Computed<bool>(() => super.isPaused, name: '_MusicStore.isPaused'))
      .value;
  Computed<bool>? _$isStoppedComputed;

  @override
  bool get isStopped => (_$isStoppedComputed ??=
          Computed<bool>(() => super.isStopped, name: '_MusicStore.isStopped'))
      .value;

  late final _$isMutedAtom =
      Atom(name: '_MusicStore.isMuted', context: context);

  @override
  bool get isMuted {
    _$isMutedAtom.reportRead();
    return super.isMuted;
  }

  @override
  set isMuted(bool value) {
    _$isMutedAtom.reportWrite(value, super.isMuted, () {
      super.isMuted = value;
    });
  }

  late final _$_hasPermissionAtom =
      Atom(name: '_MusicStore._hasPermission', context: context);

  @override
  bool get _hasPermission {
    _$_hasPermissionAtom.reportRead();
    return super._hasPermission;
  }

  @override
  set _hasPermission(bool value) {
    _$_hasPermissionAtom.reportWrite(value, super._hasPermission, () {
      super._hasPermission = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_MusicStore._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_currentSongIndexAtom =
      Atom(name: '_MusicStore._currentSongIndex', context: context);

  @override
  int get _currentSongIndex {
    _$_currentSongIndexAtom.reportRead();
    return super._currentSongIndex;
  }

  @override
  set _currentSongIndex(int value) {
    _$_currentSongIndexAtom.reportWrite(value, super._currentSongIndex, () {
      super._currentSongIndex = value;
    });
  }

  late final _$listSongsAtom =
      Atom(name: '_MusicStore.listSongs', context: context);

  @override
  List<SongModel> get listSongs {
    _$listSongsAtom.reportRead();
    return super.listSongs;
  }

  @override
  set listSongs(List<SongModel> value) {
    _$listSongsAtom.reportWrite(value, super.listSongs, () {
      super.listSongs = value;
    });
  }

  late final _$statutPlayerAtom =
      Atom(name: '_MusicStore.statutPlayer', context: context);

  @override
  bool get statutPlayer {
    _$statutPlayerAtom.reportRead();
    return super.statutPlayer;
  }

  @override
  set statutPlayer(bool value) {
    _$statutPlayerAtom.reportWrite(value, super.statutPlayer, () {
      super.statutPlayer = value;
    });
  }

  late final _$_MusicStoreActionController =
      ActionController(name: '_MusicStore', context: context);

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_MusicStoreActionController.startAction(name: '_MusicStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_MusicStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isMuted: ${isMuted},
listSongs: ${listSongs},
statutPlayer: ${statutPlayer},
hasPermission: ${hasPermission},
hasError: ${hasError},
length: ${length},
songNumber: ${songNumber},
isPlaying: ${isPlaying},
isPaused: ${isPaused},
isStopped: ${isStopped}
    ''';
  }
}
