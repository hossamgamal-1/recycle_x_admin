import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  static ThemeData getLightTheme() {
    return ThemeData(
        canvasColor: ColorManager.white,

        //appbar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.white,
          foregroundColor: ColorManager.black,
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),

        //textButtonTheme
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(ColorManager.mainColor),
            foregroundColor: const MaterialStatePropertyAll(ColorManager.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s4),
                side: const BorderSide(
                  color: ColorManager.mainColor,
                  width: AppSize.s1,
                ),
              ),
            ),
          ),
        ),

        //bottomNavigationBarTheme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(size: AppSize.s25),
          unselectedItemColor: ColorManager.black,
          selectedIconTheme: IconThemeData(size: AppSize.s28),
          showSelectedLabels: true,
          selectedItemColor: ColorManager.mainColor,
        ),

        //iconTheme
        iconTheme: const IconThemeData(color: ColorManager.black),

        //inputDecorationTheme
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppSize.s5),
                bottom: Radius.circular(AppSize.s5)),
            borderSide: BorderSide(
              color: ColorManager.grey,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey)),
          filled: true,
          fillColor: ColorManager.white,
          errorStyle: TextStyle(color: ColorManager.red),
        ));
  }
}
