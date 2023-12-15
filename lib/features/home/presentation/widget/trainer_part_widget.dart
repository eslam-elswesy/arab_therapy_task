import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/widget/small_info_widget.dart';
import 'package:arab_therapy_task/models/coach_model.dart';
import 'package:shimmer/shimmer.dart';


class TrainerPartWidget extends StatefulWidget {
  final List<CoachModel> coachList;
  final bool waiting;
  const TrainerPartWidget({super.key,required this.coachList,required this.waiting});

  @override
  State<TrainerPartWidget> createState() => _TrainerPartWidgetState();
}

class _TrainerPartWidgetState extends State<TrainerPartWidget> {

  int selectedStep=0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),(){
      setState(() {
        if(selectedStep!=widget.coachList.length-1){
          selectedStep++;
        }
        else{
          selectedStep=0;
        }
      });
    });
    return widget.waiting?TrainerPartWidgetShimmer():
           widget.coachList.isEmpty?Container():
              Stack(
                children: [
                  Column(
                    children: [
                      GapWidget(height: 0.05.sh),
                      Container(
                        width: 0.9.sw,
                        height: 0.17.sh,
                        decoration: AppContainerStyle.radiusAll15Shadow.copyWith(
                            color: AppColors.secondaryColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.coachList[selectedStep].name??"",style: AppTextStyle.white_13BOLD,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 4.h),
                                  child: Text(widget.coachList[selectedStep].coachId??"",style: AppTextStyle.white_13,),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    SmallInfoWidget(icon: IconsAssetsConstants.star,title: StringsAssetsConstants.rates,content: "4.6"),
                                    GapWidget(height: 0.05.sh,width: 1,color: AppColors.white,),
                                    SmallInfoWidget(icon: IconsAssetsConstants.group,title: StringsAssetsConstants.available_seats,content: "${widget.coachList[selectedStep].currentNumberOfTrainees??0}"),
                                    GapWidget(height: 0.05.sh,width: 1,color: AppColors.white,),
                                    SmallInfoWidget(icon: IconsAssetsConstants.userClock,title: StringsAssetsConstants.coach_status,content:widget.coachList[selectedStep].status=="ACTIVE"? "متاح":"غير متاح"),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),

                          ],),
                        ),
                      ),
                    ],
                  ),
                 Positioned(
                   top: 0.02.sh,
                   left: 0.02.sw,
                   // bottom: 0,
                   child:     Container(height: 0.195.sh,
                     width: 0.25.sw,
                   // color: AppColors.primaryColor,
                   child: ImagePlaceHolder(
                     img: widget.coachList[selectedStep].personalImage??"",
                     fit: BoxFit.fitHeight,
                   ),
                   ),),
                  Positioned(
                    bottom: 0.01.sh,
                    left: 0.04.sw,
                    child: AnimatedSmoothIndicator(
                      activeIndex: selectedStep,
                      count: widget.coachList.length,
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
                    ),
                  ),
                ],
              );
  }
}



class TrainerPartWidgetShimmer extends StatelessWidget {
  const TrainerPartWidgetShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(12);

    return LayoutBuilder(

      builder: (context, constraints) => Stack(
        children: [
          Column(
            children: [
              GapWidget(height: 0.04.sh),
              Container(
                width: 0.9.sw,
                height: 0.16.sh,
                decoration: AppContainerStyle.radiusAll15Shadow.copyWith(
                    color: AppColors.secondaryColor
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: _border,
                          child: ShimmerWidget.rectangular(
                            height: 20.h,
                            width: 0.2.sw,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 4.h),
                          child:  ClipRRect(
                            borderRadius: _border,
                            child: ShimmerWidget.rectangular(
                              height: 20.h,
                              width: 0.4.sw,
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: _border,
                              child: ShimmerWidget.rectangular(
                                height: 60.h,
                                width: 0.15.sw,
                              ),
                            ),
                            GapWidget(height: 0.05.sh,width: 10,),
                            ClipRRect(
                              borderRadius: _border,
                              child: ShimmerWidget.rectangular(
                                height: 60.h,
                                width: 0.15.sw,
                              ),
                            ),
                            GapWidget(height: 0.05.sh,width: 10,),
                            ClipRRect(
                              borderRadius: _border,
                              child: ShimmerWidget.rectangular(
                                height: 60.h,
                                width: 0.15.sw,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),

                  ],),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0.02.sh,
            left: 0.05.sw,
            // bottom: 0,
            child:   ClipRRect(
              borderRadius: _border,
              child: ShimmerWidget.rectangular(
                height: 0.18.sh,
                width: 0.25.sw,
              ),
            ),),
        ],
      ),
    );
  }
}

