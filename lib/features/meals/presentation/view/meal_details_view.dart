import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/meals_controller.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/food_content_widget.dart';

class MealDetailsView extends GetView<MealsController> {
  const MealDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.primaryColor,
              body:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(title: StringsAssetsConstants.edit_meal,
                      isBack: true),
                  Expanded(child: Container(color: AppColors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GapWidget(width: 1.sw,height: 0.02.sh,),
                          Container(
                            width: 0.9.sw,
                            height: 0.22.sh,
                            decoration: AppContainerStyle.radiusAll15.copyWith(
                              color: Colors.amber
                            ),
                          ),
                          GapWidget(width: 1.sw,height: 0.02.sh,),
                          Container(
                            width: 0.9.sw,
                            child: Text("سلطة الخضروات",
                              style: AppTextStyle.black_14BOLD.copyWith(
                                color: AppColors.secondaryColor,
                                fontFamily: AppConstants.fontFamily
                            ),),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 4.h,horizontal: 8),
                            child: Container(
                                width: 0.9.sw,
                                child: Text("هذا النص افتراضي هذا النص افتراضي هذا النص افتراضي هذا النص افتراضي ",
                                  maxLines: 2,
                                  style: AppTextStyle.grey_14,)),
                          ),
                          GapWidget(height: 0.02.sh,),

                          Stack(
                            children: [
                              SvgWidget(IconsAssetsConstants.fireFrame,
                              width: 0.28.sw,height: 0.28.sw,),
                              Positioned.fill(
                                child: SvgWidget(IconsAssetsConstants.caloriesFire,
                                  width: 0.24.sw,height: 0.24.sw,),
                              ),
                              Positioned.fill(
                                child: Center(child: Text("\n400\n${StringsAssetsConstants.calories_unit}",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.white_12BOLD.copyWith(
                                  color: AppColors.foodColor,
                                ),)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              StringsAssetsConstants.meal_details,
                              style: AppTextStyle.black_13.copyWith(
                                color: AppColors.dartPrimaryColor
                              ),
                            ),
                          ),
                          FoodContentWidget(colorMode: "colorful",subTextStyle: AppTextStyle.black_12,
                            currentProtein: "0",
                            currentCarb: "0",
                            currentFats: "0",
                            totalProtein: "0",
                            totalCarb: "0",
                            totalFats: "0",),
                          GapWidget(height: 0.02.sh,),
                          GapWidget(height: 2,width: 0.9.sw,color: AppColors.gray50,),
                          TextFieldWidget(
                            filled: false,
                            textAlign: TextAlign.center,
                            textInputType: TextInputType.number,
                            width: 0.9.sw,
                            label:  StringsAssetsConstants.quantity,
                            hint: StringsAssetsConstants.quantity,
                            controller:controller.quantityController,
                            error: null,
                            isLabelOutside:true,
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap:()=>controller.changeTotalCalories(operation: "add"),
                                    child: SvgWidget(IconsAssetsConstants.add,width: 0.07.sw,height: 0.07.sw,)),
                              ],
                            ),
                            prefixIcon:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap:()=>controller.changeTotalCalories(operation: "min"),
                                    child: SvgWidget(IconsAssetsConstants.minc,width: 0.07.sw,height: 0.07.sw,)),
                              ],
                            ),
                            onChange: (x){
                                controller.changeTotalCalories();
                            },
                          ),
                          GapWidget(height: 0.01.sh,),
                          ButtonWidget(onTap: (){},
                              width: 0.9.sw,
                              waitingAction: controller.waiting.value,
                              text: StringsAssetsConstants.save)
                        ],
                      ),
                    ),))
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

