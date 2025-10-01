import 'package:flutter/material.dart';

import 'challenges/easy/scale_button_on_tap.dart';
import 'challenges/awesome_transition.dart';
import 'challenges/easy/smoothly_color_transition.dart';
import 'challenges/medium/animated_slider_widget.dart';

class AnimationChallengesApp extends StatelessWidget {
  const AnimationChallengesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AnimatedSliderWidget(),
    );
  }
}
