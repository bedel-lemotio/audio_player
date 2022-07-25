import 'dart:ui';

import 'package:flutter/material.dart';

SnackBar SnackBarWidget({required BuildContext context,required bool status}) {
  return SnackBar(
    content: Row(
      children: [
        Icon(
          status ? Icons.done : Icons.error_outline_rounded,
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          status
              ? 'The plugin has permission!'
              : 'The plugin has no permission!',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ],
    ),
    backgroundColor: status ? Colors.green : Colors.red,
  );
}

