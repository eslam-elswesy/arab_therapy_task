import 'package:arab_therapy_task/features/home/presentation/views/widgets/subscription_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/why_therapy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionListPart extends StatelessWidget {
  const SubscriptionListPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          GapWidget(width: 1.sw,),
          Container(
            width: 0.9.sw,
            child: Row(
              children: [
                Text("اختر الاشتراك المناسب لك",style: AppTextStyle.black_14BOLD,),
              ],
            ),
          ),
          GapWidget(height: 0.02.sh,width: 1.sw,),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=>SubscriptionItem(isCommon: index%2==0,), separatorBuilder: (context,index)=>SizedBox(height: 32.w,), itemCount: 3),
          GapWidget(height: 0.05.sh,),
        ],
      ),
    );
  }
}
