import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void openGenderBottomSheet(BuildContext context,CaloriesController controller) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return  controller.obx(
              (snap) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SafeArea(
                      bottom: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              StringsAssetsConstants.gender_title,
                              style: AppTextStyle.black_15BOLD,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              StringsAssetsConstants.gender_title_hint,
                              style: AppTextStyle.grey_14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          GapWidget(height: 0.05.sh,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            InkWell(
                              onTap: ()=>controller.changeSelectedGender(AppConstants.genderTypes[0]),
                              child: Container(
                                width: 0.3.sw,
                                height: 0.3.sw,
                                decoration:controller.selectedGender.value==AppConstants.genderTypes[0]?
                                AppContainerStyle.radiusAll15.copyWith(
                                  color: AppColors.primaryColor
                                ):AppContainerStyle.radiusAll15.copyWith(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1
                                    )
                                ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgWidget(IconsAssetsConstants.male,width: 0.1.sw,height: 0.1.sw,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(StringsAssetsConstants.male,style: AppTextStyle.white_14.copyWith(
                                          color: controller.selectedGender.value==AppConstants.genderTypes[0]?
                                          null:AppColors.primaryColor
                                        ),),
                                      )
                                    ],)
                              ),
                            ),
                              InkWell(
                                onTap: ()=>controller.changeSelectedGender(AppConstants.genderTypes[1]),
                                child: Container(
                                  width: 0.3.sw,
                                  height: 0.3.sw,
                                    decoration:controller.selectedGender.value==AppConstants.genderTypes[1]?
                                    AppContainerStyle.radiusAll15.copyWith(
                                        color: AppColors.primaryColor
                                    ):AppContainerStyle.radiusAll15.copyWith(
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1
                                        )
                                    ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    SvgWidget(IconsAssetsConstants.female,width: 0.1.sw,height: 0.1.sw,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(StringsAssetsConstants.female,style: AppTextStyle.white_14.copyWith(
                                            color: controller.selectedGender.value==AppConstants.genderTypes[1]?
                                            null:AppColors.primaryColor
                                        ),),
                                      ),
                                    ],)
                                ),
                              ),
                          ],),
                          GapWidget(height: 0.05.sh,),
                          ButtonWidget(onTap: ()=>Navigator.pop(context),
                              width: 0.9.sw,
                              waitingAction: controller.waiting.value,
                              text: StringsAssetsConstants.choose),

                        ],
                      ),
                    ),
                  );
                },
              ),
        );
      });
}