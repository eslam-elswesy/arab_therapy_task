import 'package:arab_therapy_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.h),
              child: Hero(
                tag: "ScaleTransitionAnimationWidget",
                child:  SvgWidget(LogosAssetsConstants.logo,
                  width: 0.2.sw,
                  height: 0.03.sh,
                  fit: BoxFit.fill,
                ),),
            ),
            ButtonWidget(onTap: ()=>Get.toNamed(AppRoutes.startNow),
                width: 0.25.sw,
                padding: 4.h,
                text: "ابدأ للآن")
          ],
        ),
      ),
    );
  }
}
