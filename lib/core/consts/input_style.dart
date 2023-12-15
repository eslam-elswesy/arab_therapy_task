
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';

class AppInputStyle {
  static InputDecoration textFieldDecoration(
      {String? hintText,
        Color? fillColor,
        String? helperText,
        TextStyle? hintStyle,
        String? labelText,
        Widget? prefixIcon, Widget? suffixIcon, String? errorText, bool? filled}) {
    filled = filled ?? true;
    return InputDecoration(
      fillColor: fillColor??AppColors.gray100,
      filled: filled,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hintText,
      labelText: !filled ? labelText : null,
      hintStyle:hintStyle?? AppTextStyle.grey_13,
      labelStyle: AppTextStyle.black_14,

      helperText:helperText==null||helperText==""?null:helperText,
      helperStyle: AppTextStyle.black_13.copyWith(color: AppColors.gray400),
      errorText: errorText == null || errorText == "" ? null : errorText,
      errorStyle: AppTextStyle.black_12.copyWith(color: AppColors.delete),
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.gray100,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.gray100,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: AppColors.gray100,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.red)),
    );
  }
}
