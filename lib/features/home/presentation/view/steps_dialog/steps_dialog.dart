import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/services/time_service.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:arab_therapy_task/features/home/presentation/view/steps_dialog/add_step_bottom_sheet.dart';
import 'package:arab_therapy_task/features/home/presentation/view/water_view/add_water_buttom_sheet.dart';
import 'package:arab_therapy_task/line_chart.dart';

Future<dynamic>  openStepsDialog(BuildContext context,HomeController controller) {

  return showDialog(
      context: context,
      builder: (ctx) =>
          StatefulBuilder(builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.all(10.h),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15.0))),
              child: Container(
                  width: 0.9.sw,
                  height: 0.6.sh,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 0.9.sw,
                            height: 0.3.sh,
                            decoration: AppContainerStyle.radiusTop15.copyWith(
                                image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),
                                    colorFilter: ColorFilter.mode(AppColors.foodColor.withOpacity(0.8), BlendMode.overlay),fit: BoxFit.fill)
                            ),
                          ),
                          Container(
                            width: 0.9.sw,
                            height:0.3.sh,
                            decoration:  AppContainerStyle.radiusBottom15.copyWith(
                              color: AppColors.foodColor.withOpacity(0.8),
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
                                Icon(Icons.attach_file,color: AppColors.white,size: 15,),
                                Text(StringsAssetsConstants.iphone_attach,style: AppTextStyle.white_12,)
                              ],),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 5,
                                      percent: 0.78,
                                      progressColor: Colors.white,
                                      backgroundColor: AppColors.white.withOpacity(0.5),
                                      center: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("${controller.userInfoModel.value.currentSteps??0}/${controller.userInfoModel.value.steps??0}",style: AppTextStyle.white_12BOLD,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // SvgWidget(IconsAssetsConstants.caloriesWhite,width: 10.h,height: 20.h,),
                                              Text(StringsAssetsConstants.step,style: AppTextStyle.white_12BOLD),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    LineChartWidget(widgetColor: AppColors.foodColor,
                                        scheduleTitle: StringsAssetsConstants.calories),
                                  ],
                                ),
                              ),
                            ),
                            ButtonWidget(onTap: ()=>openAddStepBottomSheet(context,controller),
                                textColor: AppColors.primaryColor,
                                btnColor: AppColors.white,
                                borderColor: AppColors.white,
                                text: "${StringsAssetsConstants.add} +"),
                            GapWidget(height: 0.01.sh,)

                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }));
}