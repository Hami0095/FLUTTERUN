import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    primarySwatch: Colors.amber,
    dividerColor: Colors.amber,
    cardColor: Colors.amber,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
    ),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.amber;
          }
          return Colors.white;
        },
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 70,
      ),
      titleMedium: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 60,
      ),
      titleSmall: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 50,
      ),
      bodyLarge: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 20,
      ),
      headlineLarge: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 35,
        fontWeight: FontWeight.bold,
        // fontStyle:
      ),
      labelLarge: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 13,
      ),
      labelSmall: TextStyle(
        color: Colors.amber,
        fontFamily: 'OtraMasStf',
        fontSize: 11,
      ),
    ),
    buttonColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(
      onPrimary: Colors.transparent,
      onError: Colors.red,
      brightness: Brightness.light,
      primary: Colors.amber,
      secondary: Colors.orange,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'OtraMasStf', color: Colors.amber),
      backgroundColor: Colors.amber,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
  );
}
