import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/services/time_service.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:arab_therapy_task/line_chart.dart';







 Future<dynamic>  openSleepDialog(BuildContext context,HomeController controller) {

   ClockTimeFormat _clockTimeFormat = ClockTimeFormat.twentyFourHours;
   ClockIncrementTimeFormat _clockIncrementTimeFormat =
       ClockIncrementTimeFormat.fiveMin;

   PickedTime _inBedTime = PickedTime(h: 0, m: 0);
   PickedTime _outBedTime = PickedTime(h: 8, m: 0);
   PickedTime _intervalBedTime = PickedTime(h: 0, m: 0);


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
                   height: 0.9.sh,
                   child: Stack(
                     children: [
                       Column(
                         children: [
                           Container(
                             width: 0.9.sw,
                             height: 0.4.sh,
                             decoration: AppContainerStyle.radiusTop15.copyWith(
                                 image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),
                                     colorFilter: ColorFilter.mode(AppColors.sleepColor.withOpacity(0.8), BlendMode.overlay),fit: BoxFit.fill)
                             ),
                           ),
                           Container(
                             width: 0.9.sw,
                             height: 0.5.sh,
                             decoration:  AppContainerStyle.radiusBottom15.copyWith(
                               color: AppColors.sleepColor.withOpacity(0.8),
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
                                     TimePicker(
                                       initTime: _inBedTime,
                                       endTime: _outBedTime,
                                       height:  0.48.sw,
                                       width: 0.48.sw,
                                       onSelectionChange: (PickedTime init, PickedTime end, bool? isDisableRange) {
                                         _inBedTime = init;
                                         _outBedTime = end;
                                         _intervalBedTime = formatIntervalTime(
                                           init: _inBedTime,
                                           end: _outBedTime,
                                           clockTimeFormat: _clockTimeFormat,
                                           clockIncrementTimeFormat: _clockIncrementTimeFormat,
                                         );
                                         setState((){
                                           print(
                                               'onChange => init : ${init.h}:${init.m}, end : ${end.h}:${end.m}, isDisableRange: $isDisableRange');
                                         });
                                       },
                                       onSelectionEnd: (start, end, isDisableRange) => print(
                                           'onSelectionEnd => init : ${start.h}:${start.m}, end : ${end.h}:${end.m}, isDisableRange: $isDisableRange'),
                                       primarySectors: _clockTimeFormat.value,
                                       secondarySectors: _clockTimeFormat.value * 2,
                                       decoration: TimePickerDecoration(
                                         baseColor: Color(0xFFFAD0FF),
                                         pickerBaseCirclePadding: 0,
                                         sweepDecoration: TimePickerSweepDecoration(
                                           pickerStrokeWidth: 20.0,
                                           pickerColor:   AppColors.sleepColor,
                                           showConnector: false,
                                         ),
                                         initHandlerDecoration: TimePickerHandlerDecoration(
                                           color: AppColors.sleepColor,
                                           shape: BoxShape.circle,
                                           radius: 12.0,
                                           icon: Icon(
                                             Icons.nightlight_outlined,
                                             size: 15.0,
                                             color: AppColors.white,
                                           ),
                                         ),
                                         endHandlerDecoration: TimePickerHandlerDecoration(
                                           color: AppColors.sleepColor,
                                           shape: BoxShape.circle,
                                           radius: 12.0,
                                           icon: Icon(
                                             Icons.sunny,
                                             size: 15.0,
                                             color: AppColors.white,
                                           ),
                                         ),
                                         primarySectorsDecoration: TimePickerSectorDecoration(
                                           color: AppColors.white,
                                           width: 1.0,
                                           size: 4.0,
                                           radiusPadding: 25.0,
                                         ),
                                         secondarySectorsDecoration: TimePickerSectorDecoration(
                                           color: AppColors.sleepColor,
                                           width: 1.0,
                                           size: 2.0,
                                           radiusPadding: 25.0,
                                         ),
                                         clockNumberDecoration: TimePickerClockNumberDecoration(
                                           defaultTextColor: AppColors.white,
                                           defaultFontSize: 12.0,
                                           scaleFactor: 2.0,
                                           showNumberIndicators: true,
                                           clockTimeFormat: _clockTimeFormat,
                                           clockIncrementTimeFormat: _clockIncrementTimeFormat,
                                         ),
                                       ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(62.0),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Text(
                                               '${_intervalBedTime.h}Hr ${_intervalBedTime.m}Min',
                                               textAlign: TextAlign.center,
                                               style: TextStyle(
                                                 fontSize: 14.0,
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.bold,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                     Container(
                                       width: 0.85.sw,
                                       height: 0.08.sh,
                                       decoration: AppContainerStyle.radiusAll15.copyWith(
                                         color: AppColors.sleepColor
                                       ),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                         Container(
                                           width: 0.41.sw,
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Text(StringsAssetsConstants.sleep_time,style: AppTextStyle.white_13,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   Padding(
                                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                     child: Icon(
                                                       Icons.nightlight_outlined,
                                                       size: 20.0,
                                                       color: AppColors.white,
                                                     ),
                                                   ),
                                                   Text("${_inBedTime.h}:${_inBedTime.m}",style: AppTextStyle.white_13,),
                                                 ],)
                                             ],
                                           ),
                                         ),
                                         GapWidget(
                                           height: 0.08.sh,
                                           width: 2,
                                           color: AppColors.white,
                                         ),
                                         Container(
                                           width: 0.41.sw,
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Text(StringsAssetsConstants.wake_time,style: AppTextStyle.white_13,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                   child: Icon(
                                                     Icons.sunny,
                                                     size: 20.0,
                                                     color: AppColors.white,
                                                   ),
                                                 ),
                                                   Text("${_outBedTime.h}:${_outBedTime.m}",style: AppTextStyle.white_13,),

                                               ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],),
                                     ),
                                     LineChartWidget(widgetColor: AppColors.sleepColor,
                                     scheduleTitle: StringsAssetsConstants.sleep_chart,
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                          controller.userInfoModel.value.currentSleep!=null?
                          ButtonWidget(
                              onTap:(){},
                              waitingAction: controller.waitingUserInfo.value,
                              textColor: AppColors.white,
                              btnColor: AppColors.transparentColor,
                              borderColor: AppColors.transparentColor,
                              text: StringsAssetsConstants.already_sleep_time_added):

                          ButtonWidget(
                              onTap: ()async{
                                if(_intervalBedTime.m!=0){
                                  setState((){

                                  });
                                  double time = _intervalBedTime.h+(_intervalBedTime.m/60);
                                 await controller.updateUserInfo(context,
                                     screenName: "sleep",
                                     data: {
                                    "current_sleep":time,
                                  });
                                  setState((){
                                    print("updateScreeen");
                                  });
                                }
                                else{
                                  DialogWidget.confirmDialog(
                                      context,
                                      type: AppConstants.dialogTypes[1],
                                      agreeFunction: (bool){},
                                      title: StringsAssetsConstants.error,
                                      body: StringsAssetsConstants.general_validation,
                                      isSingleBackButton: true
                                  );
                                }
                              },
                              waitingAction: controller.waitingUserInfo.value,
                              textColor: AppColors.primaryColor,
                              btnColor: AppColors.white,
                              borderColor: AppColors.white,
                              text: StringsAssetsConstants.save),
                             GapWidget(height: 0.01.sh,)

                           ],
                         ),
                       ),
                     ],
                   )),
             );
           }));



}




