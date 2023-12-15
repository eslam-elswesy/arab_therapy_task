import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRowWidget extends StatelessWidget {
  const TextRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 0.9.sw,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 0.01.sw),
              child: Container(
                width: 0.08.sw,
                height: 0.08.sw,
                decoration: AppContainerStyle.circel.copyWith(
                  color: AppColors.thirdColor,
                ),
              ),
            ),
            Container(
              width: 0.75.sw,
              child: Text("رسائل لا محدودة مع الأخصائي النفسي طيلة فترة الاشتراك",
                textAlign: TextAlign.start,
                maxLines: 2,
                style: AppTextStyle.black_13,),
            ),
          ],
        ));
  }
}
