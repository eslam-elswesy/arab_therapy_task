import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DotRowWidget extends StatelessWidget {
  final int selectedStep;
  final int count;
  final Color? color;
  const DotRowWidget({super.key,required this.selectedStep,required this.count,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color??AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedSmoothIndicator(
              activeIndex: selectedStep,
              count: count,
              effect: ExpandingDotsEffect(
                    spacing:  8.0,
                    radius:  4.0,
                    dotWidth: 7.w,
                    dotHeight: 7.w,
                    paintStyle:  PaintingStyle.fill,
                    strokeWidth:  1.5,
                    dotColor:  AppColors.gray200,
                    activeDotColor:  AppColors.primaryColor
              ),
              // effect: WormEffect(
              //     spacing:  8.0,
              //     radius:  4.0,
              //     dotWidth:step==selectedStep?22.w: 6.w,
              //     dotHeight: 6.w,
              //     paintStyle:  PaintingStyle.stroke,
              //     strokeWidth:  1.5,
              //     dotColor:  AppColors.gray200,
              //     activeDotColor:  AppColors.primaryColor
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

