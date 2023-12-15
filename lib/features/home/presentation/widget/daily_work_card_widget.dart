import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';

class DailyWorkCard extends StatelessWidget {

  final Color cardColor;
  final String title,content,icon;
  final Function() onTap;
  final isWaiting;
  const DailyWorkCard({super.key,required this.cardColor,required this.isWaiting,required this.icon,required this.title,required this.content,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return isWaiting?DailyWorkCardShimmer():
    Padding(
      padding:  EdgeInsets.all(4.0.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 0.28.sw,
          height: 0.16.sh,
          decoration: AppContainerStyle.radiusAll15Shadow.copyWith(
              image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),
                  colorFilter: ColorFilter.mode(cardColor, BlendMode.overlay),fit: BoxFit.fill),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgWidget(icon,width: 0.08.sw,height: 0.08.sw,fit: BoxFit.fill,),
                    SvgWidget(IconsAssetsConstants.back),
                  ],
                ),
              ),
              Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                child: Text(title,style: AppTextStyle.white_13,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(content,style: AppTextStyle.white_13,),
              ),
              Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}


class DailyWorkCardShimmer extends StatelessWidget {


  const DailyWorkCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(12);
    return Padding(
      padding:  EdgeInsets.all(4.0.w),
      child: Container(
        width: 0.28.sw,
        height: 0.16.sh,
        decoration: AppContainerStyle.radiusAll15Shadow.copyWith(
            image: DecorationImage(image: AssetImage(ImagesAssetsConstants.dailyWorkBg,),fit: BoxFit.fill)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: _border,
                    child: ShimmerWidget.rectangular(
                      width: 0.08.sw,height: 0.08.sw,
                    ),
                  ),
                  SvgWidget(IconsAssetsConstants.back,color: AppColors.gray100,),
                ],
              ),
            ),
            Spacer(flex: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
              child: ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  height: 20.h,
                  width: 0.4.sw,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  height: 20.h,
                  width: 0.4.sw,
                ),
              ),
            ),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
