import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(

        // Appbar Theme
        appBarTheme: AppBarTheme(),

        // Icon Theme
        iconTheme: IconThemeData(color: Colors.black),

        // Scaffold Theme
        scaffoldBackgroundColor: Colors.yellow);
  }
}
