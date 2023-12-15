import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/services/time_service.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/add_calories_dialog.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/food_content_widget.dart';
import 'package:arab_therapy_task/line_chart.dart';

class CaloriesReportWidget extends StatelessWidget {

  final String totalCalories,currentCalories;
  final String totalFats,currentFats;
  final String totalProtein,currentProtein;
  final String totalCarb,currentCarb;

  const CaloriesReportWidget({super.key,
    required  this.totalCalories,
    required  this.currentCalories,
    required  this.totalFats,
    required  this.currentFats,
    required  this.totalProtein,
    required  this.currentProtein,
    required  this.totalCarb,
    required  this.currentCarb,
  });

  @override
  Widget build(BuildContext context) {
    bool finishedYourMeals =double.parse(currentCalories)>=double.parse(totalCalories);
    return  Container(
        width: 0.9.sw,
        height: 0.8.sh,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: 0.9.sw,
                  height: 0.4.sh,
                  decoration: AppContainerStyle.radiusTop15.copyWith(
                      image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),
                          colorFilter: ColorFilter.mode(AppColors.caloriesColor.withOpacity(0.8), BlendMode.overlay),fit: BoxFit.fill)
                  ),
                ),
                Container(
                  width: 0.9.sw,
                  height: 0.4.sh,
                  decoration:  AppContainerStyle.radiusBottom15.copyWith(
                    color: AppColors.caloriesColor.withOpacity(0.8),
                  ),

                ),
              ],
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:24,horizontal: 16),
                    child: Row(children: [
                      Icon(Icons.calendar_month,color: AppColors.white,size: 25,),
                      Text("${TimeConverterService.dayFromUTC(DateTime.now().toString())} ${TimeConverterService.dateTimeFromUTC(DateTime.now().toString())}",style: AppTextStyle.white_13,),
                      Icon(Icons.arrow_drop_down_outlined,color: AppColors.white,size: 25,),
                      Spacer(),
                      InkWell(
                          onTap:(){
                            CaloriesController  caloriesController= Get.put(CaloriesController());
                            openCaloriesBottomSheet(context,caloriesController);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgWidget(IconsAssetsConstants.edit,padding: 0,fit: BoxFit.fill),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4,left: 2,right: 2),
                                child: Text(StringsAssetsConstants.edit,style: AppTextStyle.white_12),
                              ),

                            ],
                          ))
                    ],),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GapWidget(height: 10.h,),
                          CircularPercentIndicator(
                            radius: 65.0,
                            lineWidth: 8,
                            percent: double.parse(currentCalories)/double.parse(totalCalories),
                            progressColor: Colors.white,
                            backgroundColor: AppColors.white.withOpacity(0.5),
                            center: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("$currentCalories/$totalCalories",style: AppTextStyle.white_12BOLD,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgWidget(IconsAssetsConstants.caloriesWhite,width: 10.h,height: 20.h,),
                                    Text(StringsAssetsConstants.calories_unit,style: AppTextStyle.white_12BOLD),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              StringsAssetsConstants.meal_details,
                              style: AppTextStyle.white_13BOLD,
                            ),
                          ),
                          FoodContentWidget(
                            currentProtein: currentProtein,
                            currentCarb: currentCarb,
                            currentFats: currentFats,
                            totalProtein: totalProtein,
                            totalCarb: totalCarb,
                            totalFats: totalFats,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    width: 0.03.sw,
                                    height: 0.03.sw,
                                    decoration: AppContainerStyle.circel.copyWith(
                                        color: AppColors.white
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 4),
                                  child: Text(StringsAssetsConstants.mael_warning,style:
                                  AppTextStyle.white_12),
                                ),
                              ],),
                          ),
                          LineChartWidget(widgetColor: AppColors.caloriesColor,
                            scheduleTitle: StringsAssetsConstants.calories,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonWidget(onTap: (){},
                      textColor:finishedYourMeals?AppColors.white:AppColors.primaryColor,
                      btnColor:finishedYourMeals?AppColors.transparentColor: AppColors.white,
                      borderColor:finishedYourMeals?AppColors.transparentColor: AppColors.white,
                      text:finishedYourMeals?StringsAssetsConstants.already_finished_your_meals: StringsAssetsConstants.save
                  ),
                  GapWidget(height: 0.01.sh,)

                ],
              ),
            ),
          ],
        ));
  }
}
