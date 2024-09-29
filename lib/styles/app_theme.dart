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
          maximumSize: const Size(double.infinity, 52),
          textStyle: const TextStyle(
            fontSize: 18,
            // color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix, usare foreground color
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColor.primaryBlue,
          foregroundColor: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix),// a quanto pare bisogna usare questo per cambiare colore al bottone
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryBlue,
      foregroundColor:
          isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
    ),

    //design input
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
        ),
        hintStyle: TextStyle(
          color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
        filled: true,
        fillColor: isDarkMode
            ? Colors.grey.shade900.withOpacity(0.50)
            : Colors.grey.shade400.withOpacity(0.50),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isDarkMode ? AppColor.primaryBlue : AppColor.primaryBlue),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: TextStyle(
            color:
                isDarkMode ? AppColor.additionalOne : AppColor.additionalSix)),
    //tema del divider
    dividerTheme: DividerThemeData(
      color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(
        isDarkMode ? AppColor.primaryBlue : AppColor.primaryCyan,
      ),
    ),
    iconTheme: IconThemeData(
      color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
    ),
    // iconButtonTheme: IconButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(
    //       isDarkMode ? AppColor.primaryBlue : AppColor.primaryCyan,
    //     )
    //   )
    // ),
    //colore e stile testo
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
      bodyLarge: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      headlineLarge: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
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
      headlineSmall: TextStyle(
        color: isDarkMode ? AppColor.additionalOne : AppColor.additionalSix,
      ),
      headlineMedium: TextStyle(
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
  );
}
