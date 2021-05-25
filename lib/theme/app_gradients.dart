import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppGradients {
  Gradient get background;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => LinearGradient(
        colors: [
          Color(0xff40b38c),
          Color(0xff45cc93),
        ],
        stops: [0, 1],
        transform: GradientRotation(2.35619 * pi),
      );
}
