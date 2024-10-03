import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';

class AppTheme{
  final ThemeData LightThemeMode=ThemeData(
    scaffoldBackgroundColor: Color(0xffF9FAFA),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
        bodyMedium: TextStyle(
            fontFamily: "LexendDeca",
            fontWeight: FontWeight.w400,fontSize: 14,
            color: Color(0XFFbac24252C)
        )
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.black),
      trackColor: MaterialStateProperty.all(Colors.white),
      trackOutlineColor: MaterialStateProperty.all(Colors.lightBlueAccent)
    )
  );
  final ThemeData DarkThemeMode=ThemeData(
      scaffoldBackgroundColor: Color(0xff18283A),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        bodyMedium: TextStyle(
            fontFamily: "LexendDeca",
            fontWeight: FontWeight.w400,fontSize: 14,
            color: Colors.white
        )
      ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.white),
      trackColor: MaterialStateProperty.all(Colors.blueAccent),
      trackOutlineColor: MaterialStateProperty.all(Colors.white)
    )
  );

}
