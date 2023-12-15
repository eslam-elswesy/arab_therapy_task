import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData lightTheme = ThemeData.light().copyWith(

    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: LightColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: LightColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    splashColor: AppColors.primaryColor,
    highlightColor: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      splashColor: AppColors.primaryColor,
      highlightColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    extensions: <ThemeExtension<dynamic>>[
      const ColorsStyles(
        backgroundColor: LightColors.backgroundColor,
        textColor: LightColors.textColor,
        disableColor: LightColors.disableColor,
        errorColor: LightColors.errorColor,
        infoColor: LightColors.infoColor,
        inputColor: LightColors.inputColor,
        successColor: LightColors.successColor,
        warningColor: LightColors.warningColor,
        shadowColor: LightColors.shadowColor,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: DarkColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: DarkColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
    ),
    splashColor: AppColors.primaryColor,
    highlightColor: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      splashColor: AppColors.primaryColor,
      highlightColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    extensions: <ThemeExtension<dynamic>>[
      const ColorsStyles(
        backgroundColor: DarkColors.backgroundColor,
        textColor: DarkColors.textColor,
        disableColor: DarkColors.disableColor,
        errorColor: DarkColors.errorColor,
        infoColor: DarkColors.infoColor,
        inputColor: DarkColors.inputColor,
        successColor: DarkColors.successColor,
        warningColor: DarkColors.warningColor,
        shadowColor: DarkColors.shadowColor,
      ),
    ],
  );
}
