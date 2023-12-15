import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';
import 'package:arab_therapy_task/models/image_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ImageDetailsWidget extends StatelessWidget {
  final ImageModel imageModel;
  const ImageDetailsWidget({super.key,required this.imageModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16.0),
      child:   Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: AppColors.gray200,
                width: 0.5
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 0.2.sw,height: 0.2.sw,
                    decoration: AppContainerStyle.radiusAll15,
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(15),
                      child: ImagePlaceHolder(
                        width: 0.2.sw,height: 0.2.sw,
                        img: imageModel.url??"",
                        holder: ImagesAssetsConstants.holderFood,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GapWidget(width: 0.03.sw,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 0.5.sw,
                        child: Text(imageModel.title??"StringsAssetsConstants.unknown",
                          maxLines: 1,
                          style: AppTextStyle.black_14BOLD.copyWith(
                              color: AppColors.lightPrimaryColor
                          ),),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 2.h),
                        child: Container(
                            width: 0.5.sw,
                            child: Text(imageModel.description??"StringsAssetsConstants.unknown",
                              maxLines: 2,
                              style: AppTextStyle.grey_13,)),
                      ),
                    ],
                  ),
                  Spacer(),
                ],),
              GapWidget(height: 8.h,),
            ],
          ),
        ),
      ),
    );
  }


}


class ImageDetailsWidgetShimmer extends StatelessWidget {
  const ImageDetailsWidgetShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _border = BorderRadius.circular(15);

    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16.0),
        child: Container(
          width: 0.9.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: AppColors.gray200,
                  width: 0.5
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 0.2.sw,height: 0.2.sw,
                      decoration: AppContainerStyle.radiusAll15,
                      child:   ClipRRect(
                        borderRadius: _border,
                        child: ShimmerWidget.rectangular(
                          width: 0.2.sw,height: 0.2.sw,
                        ),
                      ),
                    ),
                    GapWidget(width: 0.03.sw,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: _border,
                          child: ShimmerWidget.rectangular(
                            height: 30.h,
                            width: 0.2.sw,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 2.h),
                          child: Container(
                            width: 0.5.sw,
                            child: ClipRRect(
                              borderRadius: _border,
                              child: ShimmerWidget.rectangular(
                                height: 30.h,
                                width: 0.2.sw,
                              ),
                            ),),
                        ),
                      ],
                    ),

                  ],),

              ],
            ),
          ),
        ),
      ),
    );

  }

}