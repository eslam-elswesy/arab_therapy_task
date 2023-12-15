import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_slider.dart';
import 'package:arab_therapy_task/features/intro/presentation/controllers/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   controller.obx(
          (snap) => Scaffold(
              backgroundColor: AppColors.gray50,
              body:SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap:(){
                              Get.toNamed(AppRoutes.login);
                              controller.skip();
                            },
                            child: Text(
                              StringsAssetsConstants.skip,
                              style: AppTextStyle.black_14.copyWith(
                                  color: AppColors.primaryColor
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ImageSlider(
                      [
                        controller.introList[0].img,
                        controller.introList[1].img,
                        controller.introList[2].img,
                      ],
                      current: controller.currentStep.value,
                    ),
                    Expanded(
                      child: Container(
                        width: 1.sw,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Container(
                              width: 0.8.sw,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(controller.introList[ controller.currentStep.value].title,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.white_15ponit5BOLD.copyWith(
                                      color: AppColors.primaryColor
                                  ),),
                              ),
                            ),
                            Container(
                              width: 0.85.sw,
                              child: Text(controller.introList[ controller.currentStep.value].details,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.grey_13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          GapWidget(width: 1.sw,),
                          ButtonWidget(onTap: controller.changeCurrentStep,
                            padding:controller.currentStep.value!=2? 10.h:8.h,
                            text:controller.currentStep.value!=2? StringsAssetsConstants.next:StringsAssetsConstants.start_trip,
                          icon:controller.currentStep.value!=2?Container():
                          Container(
                            decoration: AppContainerStyle.circel.copyWith(
                              color: AppColors.white
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(4.0.w),
                              child: Center(child: Icon(Icons.arrow_forward,color: AppColors.primaryColor,)),
                            ),
                          ),),
                        ],
                      ),
                    )



                  ],
                ),
              )
          ),
    );
  }
}

