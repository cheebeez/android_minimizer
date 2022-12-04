/*
 *  back_button_behavior.dart
 *
 *  Created by Ilya Chirkunov <xc@yar.net> on 05.12.2022.
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BackButtonAction { minimize, pop }

class BackButtonBehavior extends StatelessWidget {
  const BackButtonBehavior({
    super.key,
    required this.onBackTap,
    required this.child,
  });

  final BackButtonAction onBackTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        switch (onBackTap) {
          case BackButtonAction.minimize:
            await BackButtonMethods.minimize();
            return false;
          case BackButtonAction.pop:
            return true;
        }
      },
      child: child,
    );
  }
}

class BackButtonMethods {
  static const _methodChannel = MethodChannel('back_button_behavior');

  /// Move to background.
  static Future<void> minimize() async {
    await _methodChannel.invokeMethod('minimize');
  }
}
