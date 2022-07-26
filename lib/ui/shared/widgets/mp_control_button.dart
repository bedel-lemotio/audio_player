import 'package:audio_player/constants/colors.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final VoidCallback _onTap;
  final IconData iconData;

  ControlButton(this.iconData, this._onTap);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: _onTap,
      iconSize: 30.0,
      icon:  Icon(iconData),
      color: Colors.white,
    );
  }
}
