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






void openAddWaterBottomSheet(BuildContext context,HomeController controller) {
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
            height: 0.6.sh,
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
                            StringsAssetsConstants.water_liters,
                            style: AppTextStyle.black_15BOLD,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            StringsAssetsConstants.water_liters_hint,
                            style: AppTextStyle.grey_14,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GapWidget(height: 0.01.sh,),
                        Container(
                          height: 0.06.sh,
                          width: 0.9.sw,
                          child:Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index)=> InkWell(
                                    onTap:()=>controller.changeSelectedWater(index),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: AppContainerStyle.radiusAll8.copyWith(
                                          color: AppColors.gray50,
                                          border: Border.all(
                                              color: controller.selectedWater.value==index?
                                              AppColors.primaryColor:AppColors.gray50,
                                            width: 1

                                          )
                                        ),
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                                          child: Text("${(index*50)+50} ${StringsAssetsConstants.ml}",
                                            style:
                                            AppTextStyle.grey_13.copyWith(
                                                color: AppColors.primaryColor
                                            )),
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: 30,),
                              ),
                            ],
                          ),
                        ),
                        GapWidget(height: 0.01.sh,),
                        GapWidget(width: 0.9.sw,height: 0.02.sh),
                        GapWidget(width: 0.9.sw,height: 2,color: AppColors.gray100,),
                        GapWidget(width: 0.9.sw,height: 0.02.sh),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 0.3.sw,
                                height: 0.2.sh,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ScrollablePositionedList.builder(
                                        shrinkWrap: true,
                                        itemScrollController:controller.waterScrollController,
                                        itemBuilder: (context,index)=>Column(
                                          children: [
                                            InkWell(
                                              onTap:()=>controller.changeSelectedWater(index),
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Container(
                                                  child: Center(child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("${(index*50)+50}",
                                                      style:controller.selectedWater.value==index?
                                                      AppTextStyle.grey_14BOLD.copyWith(
                                                          color: AppColors.waterColor
                                                      ):AppTextStyle.grey_14,),
                                                  ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GapWidget(height: 1,width: 0.2.sw,color: AppColors.gray300,)
                                          ],
                                        ),
                                        itemCount: 30,),
                                    )
                                  ],
                                ),
                              ),
                              Text(StringsAssetsConstants.ml,style: AppTextStyle.grey_13),
                            ],),
                        ),
                        GapWidget(width: 0.9.sw,height: 1,color: AppColors.gray100,),
                        GapWidget(width: 0.9.sw,height: 0.01.sh),
                        ButtonWidget(onTap: ()=>controller.updateUserInfo(context,
                            screenName: "water",
                            data: {
                              "current_water":((controller.selectedWater.value*50)+50) + (int.parse(controller.userInfoModel.value.currentWater?.toString()??"0")),
                            }),
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




