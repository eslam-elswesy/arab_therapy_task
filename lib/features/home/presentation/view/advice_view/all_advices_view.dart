import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:flex_list/flex_list.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/advice_grid_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/food_item_widget.dart';
import 'package:arab_therapy_task/models/advice_model.dart';

class AllAdvicesView extends GetView<HomeController> {
   AllAdvicesView({Key? key}) : super(key: key);
   List<AdviceModel> searched=[];
  @override
  Widget build(BuildContext context) {

    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.gray50,
              body:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(title: StringsAssetsConstants.advices,
                      spacerTailFlex: 3,
                      spacerHeadFlex: 2,
                      isBack: true),
                  Container(
                    width: 1.sw,
                    height: 0.01.sh,
                    color: AppColors.primaryColor,
                  ),
                  Container(
                    width: 1.sw,
                    color: AppColors.primaryColor,
                    child: TextFieldWidget(
                      filled: true,
                      fillColor: AppColors.white,
                      textAlign: TextAlign.start,
                      textInputType: TextInputType.number,
                      width: 0.9.sw,
                      label:  StringsAssetsConstants.search_here,
                      hint: StringsAssetsConstants.search_here,
                      controller:controller.searchAdvicesController,
                      error: null,
                      isLabelOutside:false,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgWidget(IconsAssetsConstants.search),
                        ],
                      ),
                      onChange: (x){
                       searched= controller.filterAdviceList(x);
                      },
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 0.01.sh,
                    color: AppColors.primaryColor,
                  ),
                  GapWidget(width: 1.sw,height: 0.02.sh,),
                  Container(
                    width: 0.9.sw,
                    child: Text("ابدأ رحلتك نحو صحة أفضل",
                      style: AppTextStyle.black_14BOLD.copyWith(
                          color: AppColors.secondaryColor,
                          fontFamily: AppConstants.fontFamily
                      ),),
                  ),
                  controller.searchAdvicesController.text.isEmpty?
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 0.43.sw,
                        mainAxisExtent: 0.22.sh,
                        childAspectRatio: 5 / 6,
                        crossAxisSpacing: 16.h,
                        mainAxisSpacing: 16.h,
                      ),
                      itemCount: controller.adviceList.length,
                      padding: EdgeInsets.symmetric(vertical:8.h,horizontal: 16.w),
                      itemBuilder: (context, index)=>AdviceGridWidget(adviceModel: controller.adviceList[index],),
                    ),
                  ):Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 0.43.sw,
                        mainAxisExtent: 0.22.sh,
                        childAspectRatio: 5 / 6,
                        crossAxisSpacing: 16.h,
                        mainAxisSpacing: 16.h,
                      ),
                      itemCount: searched.length,
                      padding: EdgeInsets.symmetric(vertical:8.h,horizontal: 16.w),
                      itemBuilder: (context, index)=>AdviceGridWidget(adviceModel: searched[index],),
                    ),
                  ),
                ],
              )
          ),
      onLoading: Container(
        height: 0.8.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container()
            ),
          ],
        ),
      ),
    );
  }

}

