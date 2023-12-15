import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class UserLoginWidget extends StatelessWidget {
  const UserLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 0.9.sw,
        decoration: AppContainerStyle.radiusAll15Shadow.copyWith(
          color: AppColors.secondaryColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            SvgWidget(IconsAssetsConstants.subscripe,fit: BoxFit.fill,width: 0.1.sw,height: 0.1.sw,),
            GapWidget(width: 0.03.sw,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringsAssetsConstants.active_account,style: AppTextStyle.white_13BOLD,),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.h),
                  child: Text(StringsAssetsConstants.active_account_hint,style: AppTextStyle.white_13,),
                ),

              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmallButtonWidget(),
            )
          ],),
        ),
      ),
    );
  }
}
