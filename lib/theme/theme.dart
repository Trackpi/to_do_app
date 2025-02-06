import 'package:flutter/material.dart';
import 'package:to_do_app/constants/constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(

        // Appbar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),

        // Icon Theme
        iconTheme: IconThemeData(color: Colors.black),

        // Scaffold Theme
        scaffoldBackgroundColor: primaryColor);
  }
}
