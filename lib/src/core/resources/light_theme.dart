import 'package:flutter/material.dart';
import 'package:gpt_client/src/core/resources/sizes.dart';

final lightTheme = ThemeData(
  fontFamily: 'Inter',
  scaffoldBackgroundColor: const Color.fromARGB(255, 249, 249, 249),
  primaryColor: const Color(0xFF58889C),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    titleSpacing: kDefaultPadding,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Color.fromARGB(255, 111, 181, 210),
    selectionHandleColor: Color.fromARGB(255, 111, 181, 210),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(const Color(0xFF58889C)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);
