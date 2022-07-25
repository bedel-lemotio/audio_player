import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../constants/app_images.dart';



Widget blurWidget(SongModel song) {
  return QueryArtworkWidget(
    id: song.id,
    type: ArtworkType.AUDIO,
    errorBuilder:(context, _,__){
      return Image.asset(
        AppImages.lady,
        fit: BoxFit.cover,
        height: 250.0,
        gaplessPlayback: false,
      );
    },
    artworkRepeat: ImageRepeat.noRepeat,
    artworkFit: BoxFit.cover,
  );
}