import 'dart:io';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../constants/app_images.dart';
import '../../../core/libraries/package/custom/lib/kenviews.dart';




class AlbumUI extends StatefulWidget {
  final SongModel song;
  final Duration? position;
  final Duration? duration;
  const AlbumUI(this.song, this.duration, this.position);
  @override
  AlbumUIState createState() {
    return AlbumUIState();
  }
}

class AlbumUIState extends State<AlbumUI> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.elasticOut);
    animation!.addListener(() => setState(() {}));
    animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox.fromSize(
      size: Size(animation!.value * 250.0, animation!.value * 250.0),
      child: Stack(
        children: <Widget>[
          KenViews(
            maxScale: 2,
            child: Hero(
              tag: widget.song.title,
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                elevation: 5.0,
                child: QueryArtworkWidget(
                  id: widget.song.id,
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: Image.asset(
                    AppImages.albumPlaceholder,
                    fit: BoxFit.cover,
                    height: 250.0,
                    gaplessPlayback: false,
                  ),
                  errorBuilder:(context, _,__){
                    return Image.asset(
                      AppImages.albumPlaceholder,
                      fit: BoxFit.cover,
                      height: 250.0,
                      gaplessPlayback: false,
                    );
                  },
                  artworkRepeat: ImageRepeat.noRepeat,
                  artworkFit: BoxFit.cover,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}