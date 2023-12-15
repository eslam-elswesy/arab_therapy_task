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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';






void openCaloriesBottomSheet(BuildContext context,CaloriesController controller) {
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
                  height: 0.85.sh,
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
                                  StringsAssetsConstants.calories,
                                  style: AppTextStyle.black_15BOLD,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  StringsAssetsConstants.calories_hint,
                                  style: AppTextStyle.grey_14,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GapWidget(height: 0.01.sh,),
                              TextFieldWidget(
                                filled: false,
                                textAlign: TextAlign.center,
                                textInputType: TextInputType.number,
                                width: 0.9.sw,
                                label:  StringsAssetsConstants.calories,
                                hint: "${StringsAssetsConstants.calories_unit}",
                                controller:controller.caloriesAddController,
                                error: null,
                                isLabelOutside:true,
                                suffixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap:()=>controller.changeTotalCalories(operation: "add"),
                                         child: SvgWidget(IconsAssetsConstants.add,color: AppColors.primaryColor,width: 0.05.sw,height: 0.05.sw,)),
                                  ],
                                ),
                                prefixIcon:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap:()=>controller.changeTotalCalories(operation: "min"),
                                        child: SvgWidget(IconsAssetsConstants.minc,color: AppColors.primaryColor,width: 0.05.sw,height: 0.05.sw,)),
                                  ],
                                ),
                                onChange: (x){
                                  setState(() {
                                    controller.changeTotalCalories();
                                  });
                                },
                              ),
                              GapWidget(width: 0.9.sw,height: 0.02.sh),
                              GapWidget(width: 0.9.sw,height: 2,color: AppColors.gray100,),
                              GapWidget(width: 0.9.sw,height: 0.02.sh),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 0.3.sw,
                                      height: 0.2.sh,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(StringsAssetsConstants.proten,style: AppTextStyle.white_13.copyWith(
                                              color: AppColors.delete
                                          ),),
                                          GapWidget(height: 0.01.sh,width: 0.2.sw,),
                                          Expanded(
                                            child: NotificationListener<ScrollUpdateNotification>(
                                              onNotification: (notification) {
                                                setState((){
                                                  print(notification.metrics.pixels);
                                                });
                                                return true;
                                              },
                                              child: ScrollablePositionedList.builder(
                                                shrinkWrap: true,
                                                itemScrollController:controller.protienScrollController,
                                                itemPositionsListener: controller.protienPositionsListener,
                                                itemBuilder: (context,index)=>Column(
                                                  children: [
                                                    InkWell(
                                                      onTap:()=>controller.changeSelectedProtein(index),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Container(
                                                          child: Center(child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(index.toString(),
                                                              style:controller.selectedprotien.value==index?
                                                              AppTextStyle.grey_14BOLD.copyWith(
                                                                color: AppColors.delete
                                                              ):AppTextStyle.grey_14,),
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GapWidget(height: 1,width: 0.2.sw,color: AppColors.gray300,)
                                                  ],
                                                ),
                                                itemCount: 700,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 0.3.sw,
                                      height: 0.2.sh,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(StringsAssetsConstants.carp,style: AppTextStyle.white_13.copyWith(
                                              color: AppColors.waterColor
                                          ),),
                                          GapWidget(height: 0.01.sh,width: 0.2.sw,),
                                          Expanded(
                                            child: NotificationListener<ScrollUpdateNotification>(
                                              onNotification: (notification) {
                                                setState((){
                                                  print(notification.metrics.pixels);
                                                });
                                                return true;
                                              },
                                              child: ScrollablePositionedList.builder(
                                                shrinkWrap: true,
                                                itemScrollController:controller.carpScrollController,
                                                itemPositionsListener: controller.carbPositionsListener,
                                                itemBuilder: (context,index)=>Column(
                                                  children: [
                                                    InkWell(
                                                      onTap:()=>controller.changeSelectedCarb(index),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Container(
                                                          child: Center(child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(index.toString(),
                                                              style:controller.selectedCarb.value==index?
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
                                                ),itemCount: 700,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 0.3.sw,
                                      height: 0.2.sh,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(StringsAssetsConstants.fats,style: AppTextStyle.white_13.copyWith(
                                              color: AppColors.fatColor
                                          ),),
                                          GapWidget(height: 0.01.sh,width: 0.2.sw,),
                                          Expanded(
                                            child: NotificationListener<ScrollUpdateNotification>(
                                              onNotification: (notification) {
                                                setState((){
                                                  print(notification.metrics.pixels);
                                                });
                                                return true;
                                              },
                                              child: ScrollablePositionedList.builder(
                                                shrinkWrap: true,
                                                itemScrollController:controller.fatsScrollController,
                                                itemPositionsListener: controller.fatsPositionsListener,
                                                itemBuilder: (context,index)=>Column(
                                                  children: [
                                                    InkWell(
                                                    onTap:()=>controller.changeSelectedFats(index),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Container(
                                                          child: Center(child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(index.toString(),
                                                              style:controller.selectedFats.value==index?
                                                              AppTextStyle.grey_14BOLD.copyWith(
                                                                  color: AppColors.fatColor
                                                              ):AppTextStyle.grey_14,),
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GapWidget(height: 1,width: 0.2.sw,color: AppColors.gray300,)
                                                  ],
                                                ),itemCount: 700,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Container(
                                        width: 0.03.sw,
                                        height: 0.03.sw,
                                        decoration: AppContainerStyle.circel.copyWith(
                                            color: AppColors.delete
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 4),
                                      child: Text("${StringsAssetsConstants.presentage} ${controller.getPresentage()}%",style:
                                      AppTextStyle.black_13.copyWith(
                                          color: AppColors.delete
                                      ),),
                                    ),
                                  ],),
                              ),
                              GapWidget(width: 0.9.sw,height: 1,color: AppColors.gray100,),
                              GapWidget(width: 0.9.sw,height: 0.01.sh),
                              ButtonWidget(onTap: ()=>controller.updateUserCaloriesInfo(context),
                                  width: 0.9.sw,
                                  waitingAction: controller.waiting.value,
                                  text: StringsAssetsConstants.enter),
                              ButtonWidget(onTap: ()=>Get.toNamed(AppRoutes.calculateCaloriesByPersonalInfo),
                                  width: 0.9.sw,
                                  btnColor: AppColors.transparentColor,
                                  textColor: AppColors.primaryColor,
                                  text: StringsAssetsConstants.calories_by_personal_data)
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




