import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
          decoration: AppContainerStyle.radiusAll15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 0.45.sw,
                height: 0.15.sh,
                decoration:AppContainerStyle.radiusTop15.copyWith(
                    color: AppColors.primaryColor
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text("مسخن",style: AppTextStyle.black_14,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(StringsAssetsConstants.family_meals_hint,
                  style: AppTextStyle.grey_12,),
              )

            ],
          )
      ),
    );
  }
}
