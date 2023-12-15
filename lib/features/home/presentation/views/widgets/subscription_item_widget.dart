import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SubscriptionItem extends StatelessWidget {
  final bool isCommon;
  const SubscriptionItem({super.key,required this.isCommon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 0.9.sw,

          decoration: AppContainerStyle.radiusAll15.copyWith(
              color: AppColors.transparentColor,
              border: Border.all(
                  color: AppColors.gray100,width: 1
              )
          ),
          child: Column(
            children: [
              GapWidget(height: 0.03.sh,),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 25.w),
                    child: Container(
                      width: 0.15.sw,
                      height: 0.15.sw,
                      color: AppColors.thirdColor,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("حزمة الأمان",style: AppTextStyle.black_13BOLD,),
                      Text("وفر 50% لأول جلسة",style: AppTextStyle.black_13,),
                      Text("29.99 ",style: AppTextStyle.black_16BOLD.copyWith(
                        color: AppColors.success
                      ),),
                      Text("وفر 50% لأول جلسة",style: AppTextStyle.black_13,),
                      GapWidget(height: 0.01.sh,),
                    ],
                  )
                ],
              ),
              GapWidget(width: 0.8.sw,height: 1,color: AppColors.gray100,),
             TextRowWidget(),
             TextRowWidget(),
             TextRowWidget(),
            ],
          ),
        ),
        isCommon? Positioned(
          top: 0.04.sh,
            left: 1,
            child: Container(
          decoration: BoxDecoration(
              color: Colors.amber ,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
          ),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal: 0.08.sw,vertical: 5.h),
           child: Text("شائع",style: AppTextStyle.white_13,),
         ),
        )):Container()
      ],
    );
  }
}
