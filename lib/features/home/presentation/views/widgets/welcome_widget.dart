import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: AppColors.secondaryColor,
      child: Column(
        children: [
          GapWidget(height: 0.03.sh,),
          Container(
            width: 0.3.sw,
            height: 0.3.sw,
            color: AppColors.thirdColor,
          ),
          Text("هل تشعر بالوحدة؟ نحن معك",style: AppTextStyle.black_16BOLD,),
          Container(
              width: 0.8.sw,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text("تحدث مع طبيب أو أخصائي نفسي عبر الانترنت،بكفاءة ومعايير ألمانية",
                textAlign: TextAlign.center,
                style: AppTextStyle.black_14,)),
          GapWidget(height: 0.02.sh,),
          ButtonWidget(onTap: ()=>Get.toNamed(AppRoutes.startNow),
              width: 0.6.sw,
              padding: 4.h,
              text: "ابدأ للآن"),
          GapWidget(height: 0.04.sh,),
        ],
      ),
    );
  }
}
