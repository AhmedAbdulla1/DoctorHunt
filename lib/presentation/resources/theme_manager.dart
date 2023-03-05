import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main color
    scaffoldBackgroundColor: const Color(0x000EBE7F),
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    //cardView theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
    ),
    //appBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s4,
      color: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.white,
      ),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
      ),
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(
        color: ColorManager.white,
        fontSize: FontSize.s22,
      ),
      // use in title for pages
      headlineLarge: getMediumStyle(
        color: ColorManager.black,
        fontSize: FontSize.s24,
      ),
      // used in sub title for pages
      headlineMedium: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      headlineSmall: getMediumStyle(
        color: ColorManager.grey,
        fontSize: AppSize.s14,
      ),
      bodyLarge: getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      // used in google and facebook buttons
       bodySmall: getLightStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      labelSmall: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s10,
      ),
      labelLarge: getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s22,
      ),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(
        AppPadding.p16,
      ),
      //error style
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),

      //hint style
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      //label style
      labelStyle: getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s14,
      ),
      //enable border st4yle
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s12,
        ),
        borderSide: BorderSide(
          color: ColorManager.lightGrey.withOpacity(0.16),
          width: AppSize.s1_5,
        ),
      ),

      //focused Border style
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s12,
        ),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),

      //error border style
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s12,
        ),
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
      ),

      //focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s12,
        ),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),
    ),
  );
}
