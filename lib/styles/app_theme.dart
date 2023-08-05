import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData getThemeData(bool isDarkMode, Brightness tema) {
  return ThemeData(
    
    scaffoldBackgroundColor:
        isDarkMode ? AppColor.additionalSix : AppColor.additionalOne,
    brightness: tema,
    listTileTheme: ListTileThemeData(
      textColor: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      //tileColor: isDarkMode ? tileBackgroundDarkMode : tileBackgoundLightMode,
      contentPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    //bottoni
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            backgroundColor: AppColor.primaryBlue,
            color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
          ),
          backgroundColor: AppColor.primaryBlue),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryBlue,
      foregroundColor: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
    ),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
        filled: true,
        fillColor: isDarkMode
            ? Colors.grey.shade900.withOpacity(0.50)
            : Colors.grey.shade400.withOpacity(0.50),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(500)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  isDarkMode ? AppColor.additionalOne : AppColor.additionalSix),
          borderRadius: BorderRadius.circular(500),
        ),
        floatingLabelStyle: TextStyle(
            color:
                isDarkMode ? AppColor.additionalOne : AppColor.additionalSix)),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      titleLarge: TextStyle(
        fontSize: 36.0,
        fontStyle: FontStyle.italic,
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      bodySmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      displaySmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      displayMedium: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      titleSmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      titleMedium: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      bodyLarge: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      headlineSmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      headlineMedium: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      headlineLarge: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      labelSmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      labelMedium: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      labelLarge: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
    ),
    // expansionTileTheme: ExpansionTileThemeData(
    //   // textColor: isDarkMode ? Colors.red : darkRedITS,
    //   // iconColor: isDarkMode ? Colors.red : darkRedITS,
    //   collapsedIconColor: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
    //   collapsedBackgroundColor: isDarkMode ? Colors.black : Colors.white,
    //   backgroundColor: isDarkMode ? Colors.black : Colors.white,
    // ),
  );
}
