import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';


class FoodContentWidget extends StatelessWidget {
  final String colorMode; //white or colorful
  final TextStyle? subTextStyle;
  final String totalFats,currentFats;
  final String totalProtein,currentProtein;
  final String totalCarb,currentCarb;


  const FoodContentWidget({super.key,
    required  this.totalFats,
    required  this.currentFats,
    required  this.totalProtein,
    required  this.currentProtein,
    required  this.totalCarb,
    required  this.currentCarb,
    this.colorMode="white",this.subTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      // color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          SvgWidget(IconsAssetsConstants.fatIcon,
            width: 0.1.sw,height: 0.1.sw,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringsAssetsConstants.fats,
                  style:colorMode=="white"? AppTextStyle.white_12BOLD: AppTextStyle.black_12BOLD,
              ),
              Text("$currentFats/$totalFats",style:subTextStyle!=null?
              subTextStyle!.copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.fatColor
              ):AppTextStyle.smallBodyTextStyle(context).copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.fatColor
              ),),
            ],
          ),
          Spacer(),
          SvgWidget(IconsAssetsConstants.protienIcon,
            width: 0.1.sw,height: 0.1.sw,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringsAssetsConstants.proten,  style:colorMode=="white"? AppTextStyle.white_12BOLD: AppTextStyle.black_12BOLD,),
              Text("$currentProtein/$totalProtein",style: subTextStyle!=null?
              subTextStyle!.copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.protienColor
              ):AppTextStyle.smallBodyTextStyle(context).copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.protienColor
              ),),
            ],
          ),
          Spacer(),
          SvgWidget(IconsAssetsConstants.carbIcon,
            width: 0.1.sw,height: 0.1.sw,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(StringsAssetsConstants.carp,  style:colorMode=="white"? AppTextStyle.white_12BOLD: AppTextStyle.black_12BOLD,),
              Text("$currentCarb/$totalCarb",style: subTextStyle!=null?
              subTextStyle!.copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.carbColor
              ):AppTextStyle.smallBodyTextStyle(context).copyWith(
                  color: colorMode=="white"? AppColors.white:AppColors.carbColor
              ),),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
