import 'package:audio_player/core/stores/music/music_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../constants/app_images.dart';

Widget blurWidget(SongModel song,MusicStore  musicStore) {
  return Observer(
    builder: (context) {
      return QueryArtworkWidget(
        id: musicStore.currentSong!.id,
        type: ArtworkType.AUDIO,
        errorBuilder: (context, _, __) {
          return Image.asset(
            AppImages.albumPlaceholder,
            fit: BoxFit.cover,
            height: 250.0,
            gaplessPlayback: false,
          );
        },
        artworkRepeat: ImageRepeat.noRepeat,
        artworkFit: BoxFit.cover,
      );
    },
  );
}
