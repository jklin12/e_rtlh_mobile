import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme(),
    fontFamily: 'Gilroy',
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: colorSolitude),
    borderRadius: BorderRadius.circular(10),
    gapPadding: 10,
  );

  OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: colorSecondary),
    borderRadius: BorderRadius.circular(10),
    gapPadding: 10,
  );

  OutlineInputBorder disabledOutlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
    filled: true,
    fillColor: colorSolitude,
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedOutlineInputBorder,
    disabledBorder: disabledOutlineInputBorder,
    border: outlineInputBorder,
  );
}
