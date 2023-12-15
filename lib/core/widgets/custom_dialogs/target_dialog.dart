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
import 'package:arab_therapy_task/core/widgets/option_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void openTargetBottomSheet(BuildContext context,CaloriesController controller) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return  controller.obx(
              (snap) => Container(
                height: 0.7.sh,
                child: StatefulBuilder(
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
                            StringsAssetsConstants.target_title,
                            style: AppTextStyle.black_15BOLD,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            StringsAssetsConstants.target_title_hint,
                            style: AppTextStyle.grey_14,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GapWidget(height: 0.05.sh,),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context,index)=>InkWell(
                              onTap: ()=>controller.changeSelectedTarget(AppConstants.targetTypes[index]),
                              child: GeneralOptionWidget(title: AppConstants.targetTypes[index],
                              subTitle: AppConstants.targetTypesHint[index],
                              isSelected: AppConstants.targetTypes[index]==controller.selectedTarget.value,),
                            ),
                            itemCount: AppConstants.targetTypes.length,),
                        ),
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
              ),
        );
      });
}