import 'package:flutter/material.dart';

final ThemeData quirkyTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade300,
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.grey.shade300,

  brightness: Brightness.light,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    titleLarge: TextStyle(
      height: 2,
      color: Colors.black.withOpacity(0.6),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    bodyLarge: TextStyle(fontSize: 16.0, color: Color(0xff16161A)),

    bodyMedium: TextStyle(fontSize: 14.0, color: Color(0xff72757e)),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),

  iconTheme: IconThemeData(color: Colors.black.withOpacity(0.6), size: 30.0),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF7F5AF0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
);
