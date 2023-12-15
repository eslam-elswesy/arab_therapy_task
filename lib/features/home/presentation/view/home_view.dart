import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/title_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/view/advice_view/all_advices_view.dart';
import 'package:arab_therapy_task/features/home/presentation/view/steps_dialog/steps_dialog.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/calories_controller.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/features/home/presentation/view/sleep_dialog.dart';
import 'package:arab_therapy_task/features/home/presentation/view/training_view/trainig_start_dialog.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/advice_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/daily_work_card_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/trainee_results_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/trainer_part_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/user_login_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/add_calories_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/show_calories_report_dialog.dart';
import 'water_view/water_dialog.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return  controller.obx(
          (snap){
            return  Column(
              children: [
                HeaderWidget(title: StringsAssetsConstants.welcome_home,
                  subTitle: StringsAssetsConstants.welcome_home_hint,
                  isBack: false,header: InkWell(
                      onTap:(){},
                      child: SvgWidget(IconsAssetsConstants.notification,padding: 8,fit: BoxFit.fill)),),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GapWidget(height: 0.03.sh,),
                          UserLoginWidget(),
                          GapWidget(height: 0.02.sh,),
                          TitleWidget(title: StringsAssetsConstants.daily_work,),
                          GapWidget(height: 0.01.sh,),
                          Container(
                            width: 0.9.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DailyWorkCard(
                                  onTap:(){
                                    CaloriesController  caloriesController= Get.put(CaloriesController());
                                    if(controller.userInfoModel.value.calories==null){
                                      openCaloriesBottomSheet(context,caloriesController);
                                    }else{
                                     openShowCaloriesReportDialog(context,caloriesController,
                                            totalCalories: controller.userInfoModel.value.calories??"0",
                                            currentCalories: controller.userInfoModel.value.currentCalories??"0",
                                            totalFats: controller.userInfoModel.value.fat??"0",
                                            currentFats: controller.userInfoModel.value.currentFat??"0",
                                            totalCarb: controller.userInfoModel.value.carb??"0",
                                            currentCarb: controller.userInfoModel.value.currentCarbs??"0",
                                            totalProtein: controller.userInfoModel.value.protein??"0",
                                            currentProtein: controller.userInfoModel.value.currentProtein??"0",
                                      );
                                    }
                                  },
                                  isWaiting: controller.waitingUserInfo.value,
                                  cardColor: AppColors.caloriesColor,
                                  icon: IconsAssetsConstants.calories,
                                  title: StringsAssetsConstants.calories,
                                  content: controller.userInfoModel.value.calories==null?
                                  StringsAssetsConstants.enter_calories
                                      :"${controller.userInfoModel.value.currentCalories??0}/${controller.userInfoModel.value.calories}",
                                ),
                                DailyWorkCard(onTap:()=>openTrainingDialog(context,controller),isWaiting: controller.waitingUserInfo.value,cardColor: AppColors.trainingColor,icon: IconsAssetsConstants.trainingCard,title: StringsAssetsConstants.exercises,content: StringsAssetsConstants.exercises_hint,),
                                DailyWorkCard(onTap:()=>openSleepDialog(context,controller),
                                  isWaiting: controller.waitingUserInfo.value,
                                  cardColor: AppColors.sleepColor,
                                  icon: IconsAssetsConstants.sleepCard,
                                  title: StringsAssetsConstants.sleep,
                                  content: controller.userInfoModel.value.currentSleep==null?
                                  StringsAssetsConstants.add_sleep
                                      :"${controller.userInfoModel.value.currentSleep??0} ${StringsAssetsConstants.hours}",),
                              ],),
                          ),
                          Container(
                            width: 0.9.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DailyWorkCard(onTap:()=>openWaterDialog(context,controller),
                                  isWaiting: controller.waitingUserInfo.value,
                                  cardColor: AppColors.waterColor,
                                  icon: IconsAssetsConstants.waterCard,
                                  title: StringsAssetsConstants.water,
                                  content: controller.userInfoModel.value.currentWater==null?
                                  StringsAssetsConstants.add_cup:"${controller.userInfoModel.value.currentWater} ${StringsAssetsConstants.ml}",),
                                DailyWorkCard(onTap:()=>openStepsDialog(context,controller),
                                  isWaiting: controller.waitingUserInfo.value,
                                  cardColor: AppColors.foodColor,
                                  icon: IconsAssetsConstants.stepCard,
                                  title: StringsAssetsConstants.steps,
                                  content: "${controller.userInfoModel.value.currentSteps??0} ${StringsAssetsConstants.step}",),
                              ],),
                          ),
                          GapWidget(height: 0.01.sh,),
                          TrainerPartWidget(coachList: controller.coachList,waiting: controller.waitingGetCoachs.value,),
                          GapWidget(height: 0.01.sh,),
                          TitleWidget(title: StringsAssetsConstants.advices,isWaiting: controller.waitingGetCoachs.value,end: InkWell(
                              onTap: ()=>Get.to(AllAdvicesView()),
                              child: Text(StringsAssetsConstants.more,style: AppTextStyle.grey_13,)),),
                          GapWidget(height: 0.01.sh,),
                          controller.waitingGetAdvice.value?AdviceWidgetShimmer():
                          controller.adviceList.isEmpty?Container():
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (cx,index)=>AdviceWidget(adviceModel: controller.adviceList[index]),itemCount: controller.adviceList.length,),
                          GapWidget(height: 0.02.sh,),
                          TitleWidget(title: StringsAssetsConstants.trainers_result,),
                          GapWidget(height: 0.01.sh,),
                          controller.waitingGetImageParis.value?TraineeResultsWidgetShimmer():
                          controller.imageParisList.isEmpty?Container():
                          Container(
                            height: 0.4.sw,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              itemBuilder: (cx,index)=>TraineeResultsWidget(imageParisModel: controller.imageParisList[index]),itemCount: controller.imageParisList.length,),
                          ),
                          GapWidget(height: 0.02.sh,),
                        ],
                      ),
                    )
                ),
              ],
            );
          },
    );
  }
}
