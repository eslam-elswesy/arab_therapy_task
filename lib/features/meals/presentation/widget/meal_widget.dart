import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/meal_details_view.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16.0),
      child:   Slidable(
        key: ValueKey("xxb"),
        // The start action pane is the one at the left or the top side.
        endActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          children:  [
            slideBackground(context,(){},"first")
          ],
        ),

        child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColors.gray200,
                width: 0.5
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 0.2.sw,height: 0.2.sw,
                    decoration: AppContainerStyle.radiusAll15,
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(15),
                      child: ImagePlaceHolder(
                        img: "",
                        holder: ImagesAssetsConstants.dummyFood,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GapWidget(width: 0.03.sw,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringsAssetsConstants.unknown,style: AppTextStyle.black_14BOLD.copyWith(
                          color: AppColors.secondaryColor
                      ),),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 2.h),
                        child: Container(
                            width: 0.5.sw,
                            child: Text(StringsAssetsConstants.unknown,
                              maxLines: 2,
                              style: AppTextStyle.grey_13,)),
                      ),
                      Container(
                        width: 0.52.sw,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            SvgWidget(IconsAssetsConstants.fatIcon),
                            Text("100 ج",style: AppTextStyle.white_12.copyWith(
                                color: AppColors.fatColor
                            ),),
                            Spacer(),
                            SvgWidget(IconsAssetsConstants.protienIcon),
                            Text("100 ج",style: AppTextStyle.white_12.copyWith(
                                color: AppColors.protienColor
                            ),),
                            Spacer(),
                            SvgWidget(IconsAssetsConstants.carbIcon),
                            Text("100 ج",style: AppTextStyle.white_12.copyWith(
                                color: AppColors.carbColor
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgWidget(IconsAssetsConstants.copyIcon),
                  )
                ],),
              GapWidget(height: 8.h,),
              ButtonWidget(onTap: ()=>Get.to(MealDetailsView()),
                  padding: 6,
                  width: 0.9.sw,
                  borderColor: AppColors.primaryColor,
                  textColor: AppColors.primaryColor,
                  btnColor: AppColors.transparentColor,
                  text: StringsAssetsConstants.edit)
            ],
          ),
        ),
    ),
      ),
    );
  }

  Widget slideBackground(BuildContext context, Function onTap, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 0.2.sh,
        width: 0.2.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:  SlidableAction(
                  onPressed: (context){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(text),
                            actions: <Widget>[
                              CupertinoButton(
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoButton(
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  onTap();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  backgroundColor: AppColors.delete,
                  foregroundColor: AppColors.white,
                  icon: Icons.delete_outlined,
                  label: StringsAssetsConstants.delete,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}


class MealWidgetShimmer extends StatelessWidget {
  const MealWidgetShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(15);

    return LayoutBuilder(

      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16.0),
        child: Container(
          width: 0.9.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: AppColors.gray200,
                  width: 0.5
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 0.2.sw,height: 0.2.sw,
                      decoration: AppContainerStyle.radiusAll15,
                      child:   ClipRRect(
                        borderRadius: _border,
                        child: ShimmerWidget.rectangular(
                          width: 0.2.sw,height: 0.2.sw,
                        ),
                      ),
                    ),
                    GapWidget(width: 0.03.sw,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: _border,
                          child: ShimmerWidget.rectangular(
                            height: 30.h,
                            width: 0.2.sw,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 2.h),
                          child: Container(
                              width: 0.5.sw,
                              child: ClipRRect(
                                borderRadius: _border,
                                child: ShimmerWidget.rectangular(
                                  height: 30.h,
                                  width: 0.2.sw,
                                ),
                              ),),
                        ),
                        Container(
                          width: 0.52.sw,
                          // color: Colors.amber,
                          child: Row(
                            children: [
                              SvgWidget(IconsAssetsConstants.fatIcon),
                            ClipRRect(
                              borderRadius: _border,
                              child: ShimmerWidget.rectangular(
                                height: 20.h,
                                width: 0.1.sw,
                              ),
                            ),
                              Spacer(),
                              SvgWidget(IconsAssetsConstants.protienIcon),
                              ClipRRect(
                                borderRadius: _border,
                                child: ShimmerWidget.rectangular(
                                  height: 20.h,
                                  width: 0.1.sw,
                                ),
                              ),
                              Spacer(),
                              SvgWidget(IconsAssetsConstants.carbIcon),
                              ClipRRect(
                                borderRadius: _border,
                                child: ShimmerWidget.rectangular(
                                  height: 20.h,
                                  width: 0.1.sw,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ShimmerWidget.rectangular(
                          width: 0.06.sw,height: 0.06.sw,
                        ),
                      ),
                    )
                  ],),
                GapWidget(height: 8.h,),
                ClipRRect(
                  borderRadius: _border,
                  child: ShimmerWidget.rectangular(
                    height: 35.h,
                    width: 0.9.sw,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}