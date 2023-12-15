import 'package:arab_therapy_task/core/consts/fonts_family_assets_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';




class AppTextStyle{

  static TextStyle smallBodyTextStyle(BuildContext context) => TextStyle(
    fontSize: 11.sp,
    overflow: TextOverflow.clip,
    fontFamily: AppFontsFamilyAssetsConstants.regular,
    color: AppColors.textColor(context),
  );

  static  TextStyle main_12(BuildContext context) => TextStyle(fontSize: 15.sp, color: AppColors.textColor(context),);
  static  TextStyle main_13 (BuildContext context) => TextStyle(fontSize: 17.sp, color: AppColors.textColor(context),);
  static  TextStyle main_14 (BuildContext context) => TextStyle(fontSize: 20.sp, color: AppColors.textColor(context),);
  static  TextStyle main_14Point5 (BuildContext context) => TextStyle(fontSize: 20.sp, color: AppColors.textColor(context),);
  static  TextStyle main_15Point5 (BuildContext context) =>TextStyle(fontSize: 25.sp, color: AppColors.textColor(context),);
  static  TextStyle main_15 (BuildContext context) => TextStyle(fontSize: 25.sp, color: AppColors.textColor(context),);
  static  TextStyle main_16 (BuildContext context) => TextStyle(fontSize: 30.sp, color: AppColors.textColor(context),);
  static  TextStyle main_18 (BuildContext context) => TextStyle(fontSize: 60.sp, color: AppColors.textColor(context),);
  static  TextStyle main_22 (BuildContext context) => TextStyle(fontSize: 22.sp, color: AppColors.textColor(context),);
  static  TextStyle main_24 (BuildContext context) => TextStyle(fontSize: 30.sp, color: AppColors.textColor(context),);

// black style
  static final TextStyle black_12 = TextStyle(fontSize: 15.sp, color: AppColors.black,);
  static final TextStyle black_13 = TextStyle(fontSize: 17.sp, color: AppColors.black,);
  static final TextStyle black_14 = TextStyle(fontSize: 20.sp, color: AppColors.black,);
  static final TextStyle black_14Point5 = TextStyle(fontSize: 23.sp, color: AppColors.black,);
  static final TextStyle black_15 = TextStyle(fontSize: 25.sp, color: AppColors.black,);
  static final TextStyle black_15Point5 = TextStyle(fontSize: 27.sp, color: AppColors.black,);
  static final TextStyle black_16 = TextStyle(fontSize: 30.sp, color: AppColors.black,);
  static final TextStyle black_18 = TextStyle(fontSize: 40.sp, color: AppColors.black,);

//black bold
  static final TextStyle black_12BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: AppColors.black,);
  static final TextStyle black_13BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp, color: AppColors.black,);
  static final TextStyle black_14BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: AppColors.black,);
  static final TextStyle black_14Point5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 23.sp, color: AppColors.black,);
  static final TextStyle black_15BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: AppColors.black,);
  static final TextStyle black_15ponit5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 27.sp, color: AppColors.black,);
  static final TextStyle black_16BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: AppColors.black,);
  static final TextStyle black_18BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 40.sp, color: AppColors.black,);


// white style
  static final TextStyle white_12 = TextStyle(fontSize: 15.sp, color: AppColors.white,);
  static final TextStyle white_13 = TextStyle(fontSize: 17.sp, color: AppColors.white,);
  static final TextStyle white_14 = TextStyle(fontSize: 20.sp, color: AppColors.white,);
  static final TextStyle white_14point5 = TextStyle(fontSize: 23.sp, color: AppColors.white,);
  static final TextStyle white_15 = TextStyle(fontSize: 25.sp, color: AppColors.white,);
  static final TextStyle white_15point5 = TextStyle(fontSize: 27.sp, color: AppColors.white,);
  static final TextStyle white_16 = TextStyle(fontSize: 30.sp, color: AppColors.white,);
  static final TextStyle white_18 = TextStyle(fontSize: 40.sp, color: AppColors.white,);
// white style BOLD
  static final TextStyle white_12BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: AppColors.white,);
  static final TextStyle white_13BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp, color: AppColors.white,);
  static final TextStyle white_14BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: AppColors.white,);
  static final TextStyle white_14Point5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 23.sp, color: AppColors.white,);
  static final TextStyle white_15BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: AppColors.white,);
  static final TextStyle white_15ponit5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 27.sp, color: AppColors.white,);
  static final TextStyle white_16BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: AppColors.white,);
  static final TextStyle white_18BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 40.sp, color: AppColors.white,);


//grey color
  static final TextStyle grey_12 = TextStyle(fontSize: 15.sp, color: AppColors.gray300,);
  static final TextStyle grey_13 = TextStyle(fontSize: 17.sp, color: AppColors.gray300,);
  static final TextStyle grey_14 = TextStyle(fontSize: 20.sp, color: AppColors.gray300,);
  static final TextStyle grey_14point5 = TextStyle(fontSize: 23.sp, color: AppColors.gray300,);
  static final TextStyle grey_15 = TextStyle(fontSize: 25.sp, color: AppColors.gray300,);
  static final TextStyle grey_15point5 = TextStyle(fontSize: 27.sp, color: AppColors.gray300,);
  static final TextStyle grey_16 = TextStyle(fontSize: 30.sp, color: AppColors.gray300,);
  static final TextStyle grey_18 = TextStyle(fontSize: 40.sp, color: AppColors.gray300,);
// grey style BOLD
  static final TextStyle grey_12BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: AppColors.gray300,);
  static final TextStyle grey_13BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp, color: AppColors.gray300,);
  static final TextStyle grey_14BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: AppColors.gray300,);
  static final TextStyle grey_14Point5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 23.sp, color: AppColors.gray300,);
  static final TextStyle grey_15BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: AppColors.gray300,);
  static final TextStyle grey_15ponit5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 27.sp, color: AppColors.gray300,);
  static final TextStyle grey_16BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: AppColors.gray300,);
  static final TextStyle grey_18BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 40.sp, color: AppColors.gray300,);



// darkGrey style
  static final TextStyle darkGrey_12 = TextStyle(fontSize: 15.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_13 = TextStyle(fontSize: 17.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_14 = TextStyle(fontSize: 20.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_14Point5 = TextStyle(fontSize: 23.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_15 = TextStyle(fontSize: 25.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_15point5 = TextStyle(fontSize: 27.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_16 = TextStyle(fontSize: 30.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_18 = TextStyle(fontSize: 40.sp, color: AppColors.gray600,);

//darkGrey bold
  static final TextStyle darkGrey_12BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_13BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_14BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_14Point5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 23.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_15BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_15point5BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 27.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_16BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp, color: AppColors.gray600,);
  static final TextStyle darkGrey_18BOLD = TextStyle(fontWeight: FontWeight.bold,fontSize: 40.sp, color: AppColors.gray600,);



}