
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  String title;
  String? subTitle;
  bool isBack;
  bool centerTitle;
  Widget? header;
  int? spacerTailFlex;
  int? spacerHeadFlex;


  HeaderWidget({super.key, required this.title, required this.isBack,this.header,this.subTitle,this.spacerHeadFlex,this.spacerTailFlex,this.centerTitle=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: isBack?_backHead():_mainHead()
      ),
    );
  }

  _backHead() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 12),
      child: Row(
        children: [
          InkWell(
              onTap: ()=>Get.back(),
              child: Icon(Icons.arrow_back_ios_rounded,size: 25.w,color: AppColors.white,)),
           Spacer(flex: spacerTailFlex??1),
          Text(title,style: AppTextStyle.white_13,),
          Spacer(flex: spacerHeadFlex??1,),
          header??Icon(Icons.arrow_back_ios_rounded,size: 25.w,color: AppColors.primaryColor,),
        ],
      ),
    );
  }

  _mainHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        centerTitle?   Spacer(flex: spacerTailFlex??1):Container(),
        subTitle!=null? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(title,style: AppTextStyle.white_13,),
             Padding(
               padding:  EdgeInsets.symmetric(vertical: 4.h),
               child: Text(subTitle!,style: AppTextStyle.white_14BOLD,),
             ),
           ],
         ):Text(title,style: AppTextStyle.white_14BOLD,),
           Spacer(flex: spacerHeadFlex??1,),
         header!=null?header!:Container()

        ],
      ),
    );
  }
}




