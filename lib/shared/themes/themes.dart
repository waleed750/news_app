import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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