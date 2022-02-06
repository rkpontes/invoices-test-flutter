import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.white),
    ),
  );
}
