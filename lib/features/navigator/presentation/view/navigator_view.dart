import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/features/navigator/presentation/controllers/navigator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class NavigatorView extends GetView<NavigatorController> {
   NavigatorView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop:()=> DialogWidget.onWillPop(context),
      child:  controller.obx(
            (snap) => Scaffold(
              backgroundColor: AppColors.gray50,
          key: _key,
          body:  controller.screens[controller.selectedScreenIndex.value],
              bottomNavigationBar:  CurvedNavigationBar(
              backgroundColor: AppColors.gray50,
              buttonBackgroundColor: AppColors.primaryColor,
              animationDuration:const Duration(milliseconds: 300),
              items: [
                CurvedNavigationBarItem(
                  child: Image.asset(ImagesAssetsConstants.home,
                      color:controller.selectedScreenIndex.value==0?AppColors.white:AppColors.primaryColor),
                  label: controller.selectedScreenIndex.value==0?"":StringsAssetsConstants.home,
                  labelStyle: AppTextStyle.black_12.copyWith(color: AppColors.primaryColor)
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(ImagesAssetsConstants.training,color:controller.selectedScreenIndex.value==1?AppColors.white:AppColors.primaryColor),
                    label: controller.selectedScreenIndex.value==1?"":StringsAssetsConstants.training,
                    labelStyle: AppTextStyle.black_12.copyWith(color: AppColors.primaryColor)
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(ImagesAssetsConstants.logoNav,color:controller.selectedScreenIndex.value==2?AppColors.white:AppColors.primaryColor,),
                    label: "",
                    labelStyle: AppTextStyle.black_12.copyWith(color: AppColors.primaryColor)
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(ImagesAssetsConstants.meals,color:controller.selectedScreenIndex.value==3?AppColors.white:AppColors.primaryColor),
                    label: controller.selectedScreenIndex.value==3?"":StringsAssetsConstants.meals,
                    labelStyle: AppTextStyle.black_12.copyWith(color: AppColors.primaryColor)
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(ImagesAssetsConstants.account,color:controller.selectedScreenIndex.value==4?AppColors.white:AppColors.primaryColor),
                    label: controller.selectedScreenIndex.value==4?"":StringsAssetsConstants.account,
                    labelStyle: AppTextStyle.black_12.copyWith(color: AppColors.primaryColor)
                ),
              ],
              onTap: (index)=>controller.changeSelectedIndex(index),
            ),
            ),
          ),

    );
  }
}
