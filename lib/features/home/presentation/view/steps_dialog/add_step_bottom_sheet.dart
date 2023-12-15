import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/models/country_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

void openAddStepBottomSheet(BuildContext context,HomeController controller) {

  bool isTargetStepAdded = controller.userInfoModel.value.steps!=null;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return  controller.obx(
              (snap) => Container(
            height: 0.4.sh,
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
                            isTargetStepAdded?
                            StringsAssetsConstants.steps_count:
                            StringsAssetsConstants.start_steps_count,
                            style: AppTextStyle.black_15BOLD,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            isTargetStepAdded?
                            StringsAssetsConstants.steps_count_hint:
                            StringsAssetsConstants.start_steps_count_hint,
                            style: AppTextStyle.grey_14,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GapWidget(height: 0.01.sh,),
                        GapWidget(width: 0.9.sw,height: 0.02.sh),
                        TextFieldWidget(
                          filled: false,
                          textAlign: TextAlign.center,
                          textInputType: TextInputType.number,
                          width: 0.9.sw,
                          label:  StringsAssetsConstants.steps,
                          hint: "${StringsAssetsConstants.step} ",
                          controller:controller.stepsController,
                          error: null,
                          isLabelOutside:true,
                          // onChange: (x){
                          //   setState(() {
                          //     controller.changeTotalCalories();
                          //   });
                          // },
                        ),
                        ButtonWidget(onTap: (){
                          if(controller.stepsController.text!=""){
                            controller.updateUserInfo(context,
                                screenName: "steps",
                                data:isTargetStepAdded? {
                                  "current_steps":controller.stepsController.text,
                                }:
                                {
                                  "steps":controller.stepsController.text,
                                }
                            );
                          }
                        },
                            width: 0.9.sw,
                            waitingAction: controller.waitingUserInfo.value,
                            text: StringsAssetsConstants.save),
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