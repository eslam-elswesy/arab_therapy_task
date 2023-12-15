import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/food_library_controller.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/food_content_widget.dart';
import 'package:flex_list/flex_list.dart';
import 'package:arab_therapy_task/features/meals/presentation/widget/food_item_widget.dart';

class FoodLibraryView extends GetView<FoodLibraryController> {
  const FoodLibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.gray50,
              body:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderWidget(title: StringsAssetsConstants.food_library,
                      spacerTailFlex: 3,
                      spacerHeadFlex: 2,
                      header: InkWell(
                          onTap: (){},
                          child: Text(StringsAssetsConstants.quick_add,
                          style: AppTextStyle.white_12,),
                      ),
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
                      controller:controller.searchController,
                      error: null,
                      isLabelOutside:false,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgWidget(IconsAssetsConstants.search),
                        ],
                      ),
                      suffixIcon:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){},
                            child: SvgWidget(IconsAssetsConstants.filter),
                          ),
                        ],
                      ),
                      onChange: (x){

                      },
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 0.01.sh,
                    color: AppColors.primaryColor,
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                        width: 0.9.sw,
                        child: FlexList(
                          horizontalSpacing: 20.w,
                          verticalSpacing: 15.h,
                          children: [
                            for (int index = 0; index < controller.filterList.length; index++)
                              InkWell(
                                onTap: ()=>controller.changeSelectedFilter(controller.filterList[index]),
                                child: Container(
                                  decoration: BoxDecoration(
                                          color:controller.selectedFilter.value==controller.filterList[index]?
                                          AppColors.primaryColor :AppColors.white ,
                                              borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.lightPrimaryColor.withOpacity(0.2),
                                      width: 2
                                    )
                                          ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.filterList[index],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.black_13.copyWith(
                                      color: controller.selectedFilter.value==controller.filterList[index]?
                                      AppColors.white :AppColors.primaryColor ,
                                    ),),
                                  ),
                                ),
                              )
                          ],
                         ),
                        ),
                      ),
                  GapWidget(width: 1.sw,height: 0.02.sh,),
                  controller.selectedFilter.value==StringsAssetsConstants.restaurant?
                   Container():
                  Container(
                    width: 0.9.sw,
                    child: Text(StringsAssetsConstants.choose_what_you_need,
                      style: AppTextStyle.black_14BOLD.copyWith(
                          color: AppColors.secondaryColor,
                          fontFamily: AppConstants.fontFamily
                      ),),
                  ),
                  controller.selectedFilter==StringsAssetsConstants.restaurant?
                   Expanded(child: SingleChildScrollView(child: Column(
                     children: [
                       Container(
                         width: 0.9.sw,
                         child: Text("مطعم فلسطين",
                           style: AppTextStyle.black_14BOLD.copyWith(
                               color: AppColors.secondaryColor,
                               fontFamily: AppConstants.fontFamily
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: Container(
                           height: 0.22.sh,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index)=>Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 4),
                               child: FoodItemWidget(),
                             ),itemCount: 3,),
                         ),
                       ),
                       Container(
                         width: 0.9.sw,
                         child: Text("مطعم الامراء",
                           style: AppTextStyle.black_14BOLD.copyWith(
                               color: AppColors.secondaryColor,
                               fontFamily: AppConstants.fontFamily
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: Container(
                           height: 0.22.sh,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index)=>Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 4),
                               child: FoodItemWidget(),
                             ),itemCount: 3,),
                         ),
                       ),
                       Container(
                         width: 0.9.sw,
                         child: Text("مطعم الامراء",
                           style: AppTextStyle.black_14BOLD.copyWith(
                               color: AppColors.secondaryColor,
                               fontFamily: AppConstants.fontFamily
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: Container(
                           height: 0.22.sh,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index)=>Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 4),
                               child: FoodItemWidget(),
                             ),itemCount: 3,),
                         ),
                       ),
                       Container(
                         width: 0.9.sw,
                         child: Text("مطعم الامراء",
                           style: AppTextStyle.black_14BOLD.copyWith(
                               color: AppColors.secondaryColor,
                               fontFamily: AppConstants.fontFamily
                           ),),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8.0),
                         child: Container(
                           height: 0.22.sh,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context, index)=>Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 4),
                               child: FoodItemWidget(),
                             ),itemCount: 3,),
                         ),
                       ),
                     ],
                   )))
                  :Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 0.43.sw,
                          mainAxisExtent: 0.22.sh,
                          childAspectRatio: 5 / 6,
                          crossAxisSpacing: 16.h,
                          mainAxisSpacing: 16.h,
                      ),
                      itemCount: 5,
                      padding: EdgeInsets.symmetric(vertical:8.h,horizontal: 16.w),
                      itemBuilder: (context, index)=>FoodItemWidget(),
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

