import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';



class TitleMealWidget extends StatelessWidget {
  final String title;
  final Widget? end;
  final bool hideTail;
  const TitleMealWidget({super.key,required this.title,this.end,this.hideTail=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 0.9.sw,
      child: Row(
        children: [
          Text(title,style: AppTextStyle.black_14.copyWith(
            color: AppColors.primaryColor
          ),),
          SvgWidget(IconsAssetsConstants.edit,padding: 2,fit: BoxFit.contain,color: AppColors.lightPrimaryColor,width: 0.04.sw
            ,height: 0.04.sw,),
          Spacer(),
          hideTail?Container():InkWell(
              onTap:()=>Get.toNamed(AppRoutes.foodLibrary),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgWidget(IconsAssetsConstants.addMeal,padding: 0,fit: BoxFit.fill,color: AppColors.lightPrimaryColor,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4,left: 2,right: 2),
                    child: Text(StringsAssetsConstants.add_dish,style: AppTextStyle.white_12.copyWith(
                        color: AppColors.lightPrimaryColor
                    ),),
                  ),

                ],
              )),
        ],
      ),
    );
  }
}
