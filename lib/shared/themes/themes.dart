import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_flutter/shared/themes/colors/colors.dart';

ThemeData lightTheme = ThemeData(

    primarySwatch: Colors.deepOrange ,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      backwardsCompatibility: false ,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white ,
          statusBarIconBrightness: Brightness.dark
      ) ,
    ) ,
    scaffoldBackgroundColor: Colors.white ,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.black,
          fontSize: 16.0 ,
          fontWeight: FontWeight.w700
      ) ,
      headline1: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w700 ,
        fontSize: 16.0 ,
      ) ,
    ) ,
    bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0.0 ,
        color: Colors.white
    )
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange ,
  appBarTheme: AppBarTheme(

    elevation: 0.0,
    backgroundColor:  defaultDarkModeColor,
    backwardsCompatibility: false ,
    foregroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultDarkModeColor ,
        statusBarIconBrightness: Brightness.light
    ) ,
  ) ,
  scaffoldBackgroundColor: defaultDarkModeColor ,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16.0 ,
        fontWeight: FontWeight.w700
    ) ,
    headline1: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700 ,
      fontSize: 16.0 ,
    ) ,
  ) ,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: defaultDarkModeColor ,
      elevation: 10.0 ,
      unselectedItemColor: Colors.grey
  ) ,

);