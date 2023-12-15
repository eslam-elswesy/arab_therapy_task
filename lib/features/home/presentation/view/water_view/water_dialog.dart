import 'package:get/get.dart';

import 'package:flutter/material.dart';
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
import 'package:arab_therapy_task/features/home/presentation/view/water_view/add_water_buttom_sheet.dart';
import 'package:arab_therapy_task/line_chart.dart';







Future<dynamic>  openWaterDialog(BuildContext context,HomeController controller) {

  bool isFirstTime=controller.userInfoModel.value.currentWater==null;
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
                  height:isFirstTime? 0.6.sh: 0.8.sh,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 0.9.sw,
                            height:isFirstTime? 0.3.sh: 0.4.sh,
                            decoration: AppContainerStyle.radiusTop15.copyWith(
                                image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),
                                    colorFilter: ColorFilter.mode(AppColors.waterColor.withOpacity(0.8), BlendMode.overlay),fit: BoxFit.fill)
                            ),
                          ),
                          Container(
                            width: 0.9.sw,
                            height:isFirstTime? 0.3.sh: 0.4.sh,
                            decoration:  AppContainerStyle.radiusBottom15.copyWith(
                              color: AppColors.waterColor.withOpacity(0.8),
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
                              ],),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: SvgWidget(
                                            isFirstTime?
                                            IconsAssetsConstants.emptyWater:
                                            IconsAssetsConstants.fillWater,
                                            width: 0.5.sw,
                                            height: 0.45.sw,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned.fill(child: Center(
                                          child: Text("${controller.userInfoModel.value.currentWater??0} ${StringsAssetsConstants.ml}",
                                          style: AppTextStyle.white_13BOLD,),
                                        ))
                                      ],
                                    ),
                                    isFirstTime?
                                     Column(
                                       children: [
                                         GapWidget(height: 0.05.sh,),
                                         Text(StringsAssetsConstants.no_results,style: AppTextStyle.white_13BOLD,),
                                         Container(
                                             width: 0.7.sw,
                                             child: Text(StringsAssetsConstants.add_water_hint,
                                               textAlign: TextAlign.center,
                                               style: AppTextStyle.white_12,)),
                                       ],
                                     ):
                                    LineChartWidget(widgetColor: AppColors.waterColor,
                                        scheduleTitle: StringsAssetsConstants.water_schedule),
                                  ],
                                ),
                              ),
                            ),
                            ButtonWidget(onTap: ()=>openAddWaterBottomSheet(context,controller),
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




