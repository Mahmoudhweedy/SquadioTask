import 'package:flutter/material.dart';

// Gradient
LinearGradient bottomUpLinearGradient = LinearGradient(
    colors: [
      Colors.black.withOpacity(.7),
      Colors.transparent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: const [.0, .2]);
LinearGradient upBottomLinearGradient = LinearGradient(
  colors: [
    Colors.black.withOpacity(.7),
    Colors.transparent,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [.0, .2],
);

// Radius
var radius20 = BorderRadius.circular(20);
var radius8 = BorderRadius.circular(8);
