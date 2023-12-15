import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/view/advice_view/advice_details_view.dart';
import 'package:arab_therapy_task/models/advice_model.dart';


class AdviceWidget extends StatelessWidget {
  final AdviceModel adviceModel;
  const AdviceWidget({super.key,required this.adviceModel});

  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>Get.to(AdviceDetailsView(adviceModel)),
        child: Container(
          width: 0.8.sw,
          decoration: AppContainerStyle.radiusAll15,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Container(width: 0.2.sw,height: 0.2.sw,
              decoration: AppContainerStyle.radiusAll15,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(15),
                child: ImagePlaceHolder(
                  img: adviceModel.mediaImage??"",
                  fit: BoxFit.fill,
                ),
              ),
              ),
              GapWidget(width: 0.03.sw,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(adviceModel.topic??StringsAssetsConstants.unknown,style: AppTextStyle.black_14BOLD.copyWith(
                    color: AppColors.secondaryColor
                  ),),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                        width: 0.5.sw,
                        child: Text(adviceModel.details??StringsAssetsConstants.unknown,
                          maxLines: 2,
                          style: AppTextStyle.grey_13,)),
                  ),

                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios,size: 20,color: AppColors.primaryColor,),
              )
            ],),
          ),
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