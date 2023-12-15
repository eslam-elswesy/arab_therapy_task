
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String text;

  Color? textColor;
  Color? btnColor;
  Color? borderColor;
  double? width;
  Widget? icon;
  bool? waitingAction;
  double? padding;
  double? borderRadius;

  ButtonWidget({
    required this.onTap,
    required  this.text,
    this.btnColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.icon,
    this.waitingAction,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {

    btnColor ??= AppColors.primaryColor;
    textColor ??= AppColors.white;
    borderColor ??= AppColors.primaryColor;
    width ??= 0.8.sw;

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: padding??8),
      child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius??35.0),
            border: Border.all(width: 1, color: borderColor!),
            color: btnColor
          ),
          child:_containt(context)
      ),
    );
  }

  _containt(BuildContext context) {

    if(waitingAction!=null&&waitingAction!)
      {
        return const Padding(
          padding: EdgeInsets.all(8),
          child: Center(child: CircularProgressIndicator(backgroundColor: AppColors.white,)),
        );
      }
    else
      {
        return icon!=null?
        GestureDetector(
          onTap: (){
            onTap();
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical:  padding??12),
            child: Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: icon!,
                    ),
                    Positioned.fill(
                      child: Container(
                          color: btnColor ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  text.tr,
                  style: AppTextStyle.main_14(context).copyWith(
                      color: textColor
                  ),
                ),
                Spacer(),
                icon!,
              ],
            ),
          ),
        ):
        GestureDetector(
          onTap: (){
            onTap();
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: padding??12),
            child: Center(
              child: Text(
                text,
                style:  AppTextStyle.main_14(context).copyWith(
                    color: textColor
                ),
              ),
            ),
          ),
        );
      }
  }
}


