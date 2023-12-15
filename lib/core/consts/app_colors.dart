import 'package:flutter/material.dart';

class AppColors {
  static Color? backgroundColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.backgroundColor;
  static Color? shadowColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.shadowColor;
  static Color? textColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.textColor;
  static Color? inputColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.inputColor;
  static Color? disableColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.disableColor;
  static Color? infoColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.infoColor;
  static Color? errorColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.errorColor;
  static Color? successColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.successColor;
  static Color? warningColor(BuildContext context) => Theme.of(context).extension<ColorsStyles>()?.warningColor;

  // to main colors
  static const Color dartPrimaryColor = Color(0xFF4B348C);
  static const Color primaryColor = Color(0xFF885EFE);
  static const Color lightPrimaryColor = Color(0xFFAF94FF);
  static const Color secondaryColor = Color(0xFF1E3A6A);
  static const Color thirdColor = Color(0xFFf65156);

  // to app colors
  static const Color lightColor = Color(0xFFF8F8F8);
  static const Color carbColor = Color(0xFF1285D7);
  static const Color caloriesColor = Color(0xFFF46C42);
  static const Color fatColor = Color(0xFFDFB007);
  static const Color protienColor = Color(0xFFFF2C2C);
  static const Color foodColor = Color(0xFFFF7F6B);
  static const Color sleepColor = Color(0xFF9D28AC);
  static const Color waterColor = Color(0xFF64B0FC);
  static const Color trainingColor = Color(0xFF6744CB);

 // shadow colors
  static const Color transparentColor = Colors.transparent;
  static const Color white = Colors.white;
  static const Color gray50 = Color(0xffF8F8F8);
  static const Color gray100 = Color(0xffEEEEEE);
  static const Color gray200 = Color(0xffD6D6D6);
  static const Color gray300 = Color(0xffA5A5A5);
  static const Color gray400 = Color(0xff666666);
  static const Color gray500 = Color(0xff444444);
  static const Color gray600 = Color(0xff333333);
  static const Color gray800 = Color(0xff1D1f1f);
  static const Color black = Color(0xFF0A0A0A);

  static const Color delete = Color(0xFFF55157);
  static const Color rate = Color(0xFFFFC62A);
  static const Color accept = Color(0xFF4444FF);
  static const Color success = Color(0xFF00AF6C);
  static const Color backButtonColor = Color(0xFF252F38);



  static const primaryGradientColor = LinearGradient(
    colors: [thirdColor,primaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class LightColors {
  static const Color backgroundColor = Color(0xFFD3DDF2);
  static const Color shadowColor = Color(0xFF171515);
  static const Color textColor = Color(0xFF212121);
  static const Color inputColor = Color(0xFFFAFAFA);
  static const Color disableColor = Color(0xFF9E9E9E);
  static const Color infoColor = Color(0xFF008FFF);
  static const Color errorColor = Color(0xFFFF5151);
  static const Color warningColor = Color(0xFFF59709);
  static const Color successColor = Color(0xFF73FFE0);
}

class DarkColors {
  static const Color backgroundColor = Color(0xFF181A21);
  static const Color shadowColor = Color(0xFF171515);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color inputColor = Color(0xFF1E222B);
  static const Color disableColor = Color(0xFFA39E9E);
  static const Color infoColor = Color(0xFF45ADFF);
  static const Color errorColor = Color(0xFFFF7575);
  static const Color warningColor = Color(0xFFF59709);
  static const Color successColor = Color(0xFF73FFE0);
}

@immutable
class ColorsStyles extends ThemeExtension<ColorsStyles> {
  const ColorsStyles({
    required this.backgroundColor,
    required this.disableColor,
    required this.textColor,
    required this.infoColor,
    required this.errorColor,
    required this.warningColor,
    required this.successColor,
    required this.shadowColor,
    required this.inputColor,
  });

  final Color? backgroundColor;
  final Color? disableColor;
  final Color? textColor;
  final Color? infoColor;
  final Color? errorColor;
  final Color? warningColor;
  final Color? successColor;
  final Color? shadowColor;
  final Color? inputColor;

  @override
  ColorsStyles copyWith({
    Color? backgroundColor,
    Color? disableColor,
    Color? textColor,
    Color? infoColor,
    Color? warningColor,
    Color? errorColor,
    Color? successColor,
    Color? shadowColor,
    Color? inputColor,
    Color? unSelectedColor,
    Color? cardColor,
    String? logo,
  }) {
    return ColorsStyles(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disableColor: disableColor ?? this.disableColor,
      textColor: textColor ?? this.textColor,
      infoColor: infoColor ?? this.infoColor,
      warningColor: warningColor ?? this.warningColor,
      errorColor: errorColor ?? this.errorColor,
      successColor: successColor ?? this.successColor,
      inputColor: inputColor ?? this.inputColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  ColorsStyles lerp(ThemeExtension<ColorsStyles>? other, double t) {
    if (other is! ColorsStyles) {
      return this;
    }
    return ColorsStyles(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      disableColor: Color.lerp(disableColor, other.disableColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      infoColor: Color.lerp(infoColor, other.infoColor, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      inputColor: Color.lerp(inputColor, other.inputColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
    );
  }
}
