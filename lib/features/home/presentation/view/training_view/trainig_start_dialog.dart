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







Future<dynamic>  openTrainingDialog(BuildContext context,HomeController controller) {

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
                height: 0.55.sh,
                width: 0.8.sw,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        StringsAssetsConstants.change_schedule_hint,
                        style: AppTextStyle.black_14BOLD,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        StringsAssetsConstants.we_help_you,
                        style: AppTextStyle.grey_13,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      ImagesAssetsConstants.ex1,
                      width: 0.25.sw,
                      height: 0.3.sh,
                      fit: BoxFit.fill,
                    ),
                    Spacer(),
                    ButtonWidget(onTap: ()=>openAddWaterBottomSheet(context,controller),
                        width: 0.6.sw,
                        text: StringsAssetsConstants.start_trip),
                    GapWidget(height: 0.01.sh,)

                  ],
                ),
              ),
            );
          }));



}




