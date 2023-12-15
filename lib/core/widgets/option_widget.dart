import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';


class GeneralOptionWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool isSelected;
  const GeneralOptionWidget({super.key,required this.title,required this.isSelected,this.subTitle});



  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 0.9.sw,
          decoration: AppContainerStyle.radiusAll15.copyWith(
            color: isSelected?AppColors.primaryColor:null,
            border: Border.all(color: AppColors.gray100,width: 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Radio(
                value: title,
                activeColor: AppColors.white,
                groupValue: isSelected?title:"dummy",
                onChanged: (type){},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppTextStyle.black_14BOLD.copyWith(
                      color:isSelected? AppColors.white:AppColors.secondaryColor
                  ),),
                  subTitle==null?Container():
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                        width: 0.7.sw,
                        child: Text(subTitle!,
                          maxLines: 2,
                          style: AppTextStyle.grey_12.copyWith(
                            color:  isSelected? AppColors.gray100:null
                          ),)),
                  ),

                ],
              ),
            ],),
          ),
        ),
      );
  }
}

class AdviceWidgetShimmer extends StatelessWidget {
  const AdviceWidgetShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(15);



    return LayoutBuilder(

      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 0.8.sw,
          decoration: AppContainerStyle.radiusAll15,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  width: 0.2.sw,height: 0.2.sw,
                ),
              ),
              GapWidget(width: 0.03.sw,),
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
                    child: ClipRRect(
                      borderRadius: _border,
                      child: ShimmerWidget.rectangular(
                        height: 40.h,
                        width: 0.5.sw,
                      ),
                    ),
                  ),

                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.gray100,),
              )
            ],),
          ),
        ),
      ),
    );
  }
}