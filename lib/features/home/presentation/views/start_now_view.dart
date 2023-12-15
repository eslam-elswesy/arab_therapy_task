import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/start_now_controller.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/image_details_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/subscription_list_part.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/why_therapy_list_part.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/haeder_widget.dart';



class StartNowView extends GetView<StartNowController> {
  const StartNowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.white,
              body:SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("start Now pressed",style: AppTextStyle.black_14Point5,),
                    Expanded(
                      child:controller.waiting.value==false&&controller.imagesList.isEmpty?
                      Container(
                        child: Center(child: Text("no data in the list",style: AppTextStyle.black_16BOLD,)),
                      ):
                      ListView.separated(
                          itemBuilder: (context,index)=>controller.waiting.value?ImageDetailsWidgetShimmer():
                          ImageDetailsWidget(imageModel: controller.imagesList[index],),
                          separatorBuilder: (context,index)=>SizedBox(height: 12.h,),
                          itemCount:controller.waiting.value?10: controller.imagesList.length)
                    ),

                  ],
                ),
              )
          ),
      onLoading: Container(
        height: 0.8.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SpinKitFadingFour(
                color: AppColors.primaryColor,
                size: 70.r,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

