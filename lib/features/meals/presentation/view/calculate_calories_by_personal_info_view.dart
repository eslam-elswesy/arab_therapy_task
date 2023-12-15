import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/custom_dialogs/active_rate_dialog.dart';
import 'package:arab_therapy_task/core/widgets/custom_dialogs/gender_dialog.dart';
import 'package:arab_therapy_task/core/widgets/custom_dialogs/target_dialog.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';

class CalculateCaloriesByPersonalInfo extends GetView<CaloriesController> {
  const CalculateCaloriesByPersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.primaryColor,
              body:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(title: StringsAssetsConstants.calculate_calories,
                    isBack: true),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8,top: 32),
                    child: Container(decoration: AppContainerStyle.radiusTop15,
                      child: SingleChildScrollView(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GapWidget(width: 1.sw,height: 0.02.sh,),
                            Container(
                              width: 0.9.sw,
                              child: Text(StringsAssetsConstants.calculate_calories_hint,style: AppTextStyle.black_14BOLD.copyWith(
                                  color: AppColors.secondaryColor,
                                fontFamily: AppConstants.fontFamily
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 8),
                              child: Container(
                                  width: 0.9.sw,
                                  child: Text(StringsAssetsConstants.calculate_calories_hint2,
                                    maxLines: 2,
                                    style: AppTextStyle.grey_14,)),
                            ),
                            GapWidget(height: 0.02.sh,),
                            TextFieldWidget(
                              filled: false,
                              textInputType: TextInputType.number,
                              label:  StringsAssetsConstants.height,
                              hint: StringsAssetsConstants.height_hint,
                              controller: controller.heightController,
                              error: controller.heightError.value,
                              isLabelOutside:true,
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(StringsAssetsConstants.height_unit,style: AppTextStyle.grey_13.copyWith(
                                    color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w600
                                  ),),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              filled: false,
                              textInputType: TextInputType.number,
                              label:  StringsAssetsConstants.weight,
                              hint: StringsAssetsConstants.weight_hint,
                              controller: controller.weightController,
                              error: controller.weightError.value,
                              isLabelOutside:true,
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(StringsAssetsConstants.weight_unit,style: AppTextStyle.grey_13.copyWith(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w600
                                  ),),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              filled: false,
                              readOnly: true,
                              onTap: (context){
                                // controller.genderController.text=controller.selectedGender.value;
                                openGenderBottomSheet(context,controller);
                              },
                              label:  StringsAssetsConstants.gender,
                              hint: StringsAssetsConstants.gender_hint,
                              controller: controller.genderController,
                              error: controller.genderError.value,
                              isLabelOutside:true,
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_down_sharp,size: 25,color: AppColors.secondaryColor,),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              filled: false,
                              textInputType: TextInputType.number,
                              label:  StringsAssetsConstants.age,
                              hint: StringsAssetsConstants.age_hint,
                              controller: controller.ageController,
                              error: controller.ageError.value,
                              isLabelOutside:true,
                            ),
                            TextFieldWidget(
                              filled: false,
                              readOnly: true,
                              onTap: (context)=>openTargetBottomSheet(context,controller),
                              label:  StringsAssetsConstants.target,
                              hint: StringsAssetsConstants.target_hint,
                              controller: controller.targetController,
                              error: controller.targetError.value,
                              isLabelOutside:true,
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_down_sharp,size: 25,color: AppColors.secondaryColor,),
                                ],
                              ),
                            ),
                            TextFieldWidget(
                              filled: false,
                              readOnly: true,
                              onTap: (context)=>openActiveRateBottomSheet(context,controller),
                              label:  StringsAssetsConstants.active_rate,
                              hint: StringsAssetsConstants.active_rate_hint,
                              controller: controller.activeRateController,
                              error: controller.activeRateError.value,
                              isLabelOutside:true,
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_down_sharp,size: 25,color: AppColors.secondaryColor,),
                                ],
                              ),
                            ),
                            GapWidget(height: 0.05.sh,),
                            ButtonWidget(onTap: ()=>controller.calculateCaloriesByPersonalData(context),
                                waitingAction: controller.waiting.value,
                                text: StringsAssetsConstants.next)
                          ],
                        ),
                      ),),
                  ))
                ],
              )
          ),
      onLoading: Container(
        height: 0.8.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container()
            ),
          ],
        ),
      ),
    );
  }

}

