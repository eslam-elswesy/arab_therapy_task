
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/input_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  FocusNode? focusNode;
  FocusNode? nextNode;
  TextAlign? textAlign;
  TextEditingController? controller;
  TextInputType? textInputType;
  Color? cursorColor;
  String? label;
  String? hint;
  String? error;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  double? width;
  bool? isLabelOutside;
  bool? readOnly;
  Function(BuildContext)? onTap;
  bool? filled;
  Color? fillColor;
  TextStyle? hintStyle;
  bool? autoErrorMessage;

  int? maxLines;
  String? helperText;

  Function(String value)? onChange;

  TextFieldWidget(
      {this.focusNode,
        this.controller,
        this.label,
        this.hint,
        this.filled,
        this.fillColor,
        this.hintStyle,
        this.width,
        this.onTap,
        this.isLabelOutside = false,
        this.readOnly = false,
        this.textInputType,
        this.cursorColor,
        this.nextNode,
        this.textAlign,
        this.error,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText,
        this.autoErrorMessage = false,
        this.onChange,
        this.helperText,
        this.maxLines});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          isLabelOutside == true
              ? Container(
            width: width ??  0.9.sw,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    label == null ? "" : label!.tr,
                    style: AppTextStyle.black_14,
                  ),
                )
              ],
            ),
          )
              : Container(),
          Container(
            width: width ??0.9.sw,
            child: TextField(
              textAlign:textAlign?? TextAlign.start,
              maxLines: maxLines ?? 1,
              onTap: onTap == null
                  ? null
                  : () {
                if (onTap != null) {
                  onTap!(context);
                }
              },
              readOnly: readOnly ?? false,
              obscureText: obscureText ?? false,
              style: AppTextStyle.black_14,
              focusNode: focusNode,
              controller: controller,
              keyboardType: textInputType ?? TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: cursorColor??AppColors.gray500,
              decoration: AppInputStyle.textFieldDecoration(
                  filled: filled,
                  fillColor: fillColor,
                  hintStyle: hintStyle,
                  hintText: hint == null ? "" : hint?.tr,
                  labelText:filled==true? label?.tr:null,
                  helperText: helperText,
                  errorText: error == null
                      ? null
                      : (autoErrorMessage ?? false)
                      ? "${'generalError'.tr} ${label!.tr}"
                      : error,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon),
              onSubmitted: (_) {
                nextNode == null ? FocusScope.of(context).unfocus() : FocusScope.of(context).requestFocus(nextNode);
              },
              onChanged: onChange ?? null,
            ),
          ),
        ],
      ),
    );
  }
}

