import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkTheme => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.grey.shade800,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // primary: Colors.white,
        primary: AppColors.purpleLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.purple,
      ),
    )
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: const Color(0xffF1F4F8),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.grey.shade900,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // primary: AppColors.grayDark,
        primary: AppColors.purpleLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.purple,
      ),
    )
  );
}

class AppColors {
  static const purple = Color.fromARGB(255, 157, 88, 184);
  static const purpleLight = Color(0xffAD7AB5);
  static const purpleDark = Color(0xff763B8D);

  static final grayDark = Colors.grey.shade900;
}
