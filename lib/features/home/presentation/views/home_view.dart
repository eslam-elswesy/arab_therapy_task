import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/subscription_list_part.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/why_therapy_list_part.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/haeder_widget.dart';
import 'widgets/welcome_widget.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.secondaryColor,
              body:SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const HomeHeaderWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                           const WelcomeWidget(),
                           const WhyTherapyListPart(),
                           const SubscriptionListPart(),
                          ],
                        ),
                      ),
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

