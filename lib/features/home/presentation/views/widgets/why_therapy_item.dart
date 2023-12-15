import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WhyTherapyItem extends StatelessWidget {
  const WhyTherapyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.65.sw,
      decoration: AppContainerStyle.radiusAll15.copyWith(
        color: AppColors.transparentColor,
        border: Border.all(
          color: AppColors.gray300,width: 1
        )
      ),
      child: Column(
        children: [
          GapWidget(height: 0.03.sh,),
          Container(
            width: 0.2.sw,
            height: 0.2.sw,
            color: AppColors.thirdColor,
          ),
          Text("سرية تامة",style: AppTextStyle.black_13BOLD,),
          Container(
              width: 0.5.sw,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text("كافة المعلومات التي تشاركها معنا سواء في مواقع التواصل أو بينك وبين الأخصائي خلال وأثناء الجلسات تخضع لسرية تامة.",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: AppTextStyle.black_13,)),
        ],
      ),
    );
  }
}
