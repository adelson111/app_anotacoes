import 'package:flutter/material.dart';

class StyleTheme {
  ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Color.fromRGBO(48, 90, 120, 1),
    ),
  );

  ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color.fromRGBO(48, 90, 120, 1),
    ),
  );
}
