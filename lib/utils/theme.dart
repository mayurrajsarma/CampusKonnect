// import 'dart:js';

// import 'package:campuskonnect/widgets/themebutton.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(),
    dialogTheme: const DialogTheme(
      backgroundColor: Appcolors.darkprimary,
    ),
    primaryColor: Appcolors.secondary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Appcolors.darkprimary),
    scaffoldBackgroundColor: Appcolors.darkprimary,
    canvasColor: Appcolors.darkprimary,
    appBarTheme: const AppBarTheme(color: Appcolors.darkprimary),
  );
  static final light = ThemeData(
    dialogTheme: const DialogTheme(backgroundColor: Appcolors.lightprimary),
    primaryColor: Appcolors.lightprimary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Appcolors.lightprimary),
    scaffoldBackgroundColor: Appcolors.lightprimary,
    colorScheme: const ColorScheme.light(),
    canvasColor: Appcolors.lightprimary,
    appBarTheme: const AppBarTheme(color: Appcolors.lightprimary),
  );
}

class Appcolors extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  static Color contrast = Color(0xffff);
  static Color iconcontrast = Color(0xffff);
  bool get isDark => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    Appcolors.contrast =
        isOn ? const Color(0xff1f222a) : const Color(0xff858c94);
    Appcolors.iconcontrast =
        isOn ? const Color(0xff858c94) : const Color(0xff1f222a);
    notifyListeners();
  }

  static const Color darkprimary = Color(0xff181A20);
  // Color primary = Color(0xff181A20);
  static const Color secondary = Color(0xff1f222a);
  static const Color buttoncolor = Color(0xff584cf4);
  static const Color lightprimary = Color(0xffffffff);
  static const Color formiconcolor = Color(0xff858c94);
  static const Color iconcolor = Color(0xff6a7aff);
}
