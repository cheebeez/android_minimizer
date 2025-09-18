/*
 *  back_button_behavior.dart
 *
 *  Created by Ilia Chirkunov <contact@cheebeez.com> on 05.12.2022.
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidMinimizer extends StatelessWidget {
  const AndroidMinimizer({
    super.key,
    required this.minimize,
    required this.child,
  });

  final bool minimize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !minimize,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (minimize) {
          _AndroidMinimizer.minimize();
        }
      },
      child: child,
    );
  }
}

class _AndroidMinimizer {
  static const _methodChannel = MethodChannel('android_minimizer');

  /// Move to background.
  static Future<void> minimize() async {
    await _methodChannel.invokeMethod('minimize');
  }
}
