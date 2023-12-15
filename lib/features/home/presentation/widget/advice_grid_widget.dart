import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/models/advice_model.dart';

class AdviceGridWidget extends StatelessWidget {
  final  AdviceModel adviceModel;
  const AdviceGridWidget({super.key,required this.adviceModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
          decoration: AppContainerStyle.radiusAll15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 0.45.sw,
                height: 0.15.sh,
                decoration:AppContainerStyle.radiusTop15.copyWith(
                    color: AppColors.primaryColor
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: ImagePlaceHolder(
                    img: adviceModel.mediaImage??"",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(adviceModel.topic??"",style: AppTextStyle.black_14,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(adviceModel.details??"",
                  maxLines: 1,
                  style: AppTextStyle.grey_12,),
              )

            ],
          )
      ),
    );
  }
}
