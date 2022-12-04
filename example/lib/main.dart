/*
 *  main.dart
 *
 *  Created by Ilya Chirkunov <xc@yar.net> on 05.12.2022.
 */

import 'package:flutter/material.dart';
import 'package:back_button_behavior/back_button_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BackButtonBehavior(
        onBackTap: BackButtonAction.minimize,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Back Button Behavior'),
          ),
          body: const Center(
            child: Text('Tap The Back Button.'),
          ),
        ),
      ),
    );
  }
}
