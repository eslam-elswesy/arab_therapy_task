import 'package:percent_indicator/percent_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/services/time_service.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/title_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/meals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/calories_chart_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/empty_meal_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/meal_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/title_meal_widget.dart';
import 'package:arab_therapy_task/line_chart.dart';



class MealsView extends GetView<MealsController> {
  MealsView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {

    return  controller.obx(
          (snap){
        return  Column(
          children: [
            HeaderWidget(title: StringsAssetsConstants.meals,
              centerTitle: true,
              spacerHeadFlex: 2,
              spacerTailFlex: 4,
              isBack: false,
              header: InkWell(
                  onTap:(){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(StringsAssetsConstants.add_meal,style: AppTextStyle.white_13,),
                      ),
                      SvgWidget(IconsAssetsConstants.addMeal,padding: 8,fit: BoxFit.fill),

                    ],
                  )),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 0.9.sw,
                height: 0.1.sh,
                decoration: AppContainerStyle.radiusAll40.copyWith(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: ()=>controller.changeSelectedDayIndex(controller.selectedDayIndex.value, "add"),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.arrow_back_ios,size: 20,color: AppColors.white.withOpacity(
                              controller.selectedDayIndex.value<0?1:0.3
                          )),
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(   DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(Duration(days: controller.selectedDayIndex.value))).toString(),
                              style: AppTextStyle.white_13,),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.calendar_month,color: AppColors.white,size: 20,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(StringsAssetsConstants.previous_dates,style: AppTextStyle.white_13,),
                              ),

                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: ()=>controller.changeSelectedDayIndex(controller.selectedDayIndex.value, "subtract"),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.white.withOpacity(
                              controller.selectedDayIndex.value>-6?1:0.3
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GapWidget(height: 0.03.sh,),
                      CaloriesReportWidget(
                        totalCalories: "",
                        currentCalories:"",
                        totalFats: "",
                        currentFats: "",
                        totalCarb: "",
                        currentCarb: "",
                        totalProtein: "",
                        currentProtein: "",
                      ),
                      Container(
                        width: 0.9.sw,
                        child: Row(
                          children: [
                            Text(StringsAssetsConstants.meals,style: AppTextStyle.black_14.copyWith(
                                color: AppColors.dartPrimaryColor
                            ),
                            ),
                          ],
                        ),
                      ),
                      GapWidget(height: 0.03.sh,),
                      TitleMealWidget(title: StringsAssetsConstants.launch,),
                      EmptyMealWidget(),
                      GapWidget(height: 1,width: 1.sw,color: AppColors.gray100,),
                      GapWidget(height: 0.03.sh,),
                      TitleMealWidget(title: StringsAssetsConstants.breakfast,),
                      controller.waiting.value?MealWidgetShimmer():
                      // controller.adviceList.isEmpty?Container():
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context,index)=>MealWidget(),itemCount: 1,),
                      GapWidget(height: 1,width: 1.sw,color: AppColors.gray100,),
                      GapWidget(height: 0.03.sh,),
                      TitleMealWidget(title: StringsAssetsConstants.dinner,),
                      EmptyMealWidget(),
                      GapWidget(height: 1,width: 1.sw,color: AppColors.gray100,),
                    ],
                  ),
                )
            ),
          ],
        );
      },
    );
  }
}
