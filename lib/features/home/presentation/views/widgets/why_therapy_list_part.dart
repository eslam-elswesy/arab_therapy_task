import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/views/widgets/why_therapy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WhyTherapyListPart extends StatelessWidget {
  const WhyTherapyListPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          GapWidget(height: 0.05.sh,),
          Container(
            width: 0.9.sw,
            child: Row(
              children: [
                Text("لماذا عرب ثيرابي؟",style: AppTextStyle.black_14BOLD,),
              ],
            ),
          ),
          GapWidget(height: 0.02.sh,),
          Padding(
            padding:  EdgeInsets.only(right: 20.w),
            child: Container(
              height: 0.3.sh,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>WhyTherapyItem(), separatorBuilder: (context,index)=>SizedBox(width: 32.w,), itemCount: 3),
            ),
          ),
          GapWidget(height: 0.05.sh,),
        ],
      ),
    );
  }
}
