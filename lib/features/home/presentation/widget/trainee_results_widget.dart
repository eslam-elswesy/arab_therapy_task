import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/core/widgets/shimmer_widget.dart';
import 'package:arab_therapy_task/features/home/presentation/view/compare_image_view.dart';
import 'package:arab_therapy_task/models/coach_model.dart';
import 'package:arab_therapy_task/models/image_paris_model.dart';

class TraineeResultsWidget extends StatelessWidget {
  final ImageParisModel imageParisModel;

  const TraineeResultsWidget({super.key,required this.imageParisModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>Get.to(CompareImageSlider([
          imageParisModel.beforeImage??"",
          imageParisModel.afterImage??"",
        ])),
        child: Container(
          width: 0.8.sw,
          decoration: AppContainerStyle.radiusAll15,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(children: [
              Container(width: 0.3.sw,height: 0.35.sw,
                decoration: AppContainerStyle.radiusAll15,
                child:  ClipRRect(
                    borderRadius:BorderRadius.circular(15),
                    child: ImagePlaceHolder(
                      img: imageParisModel.beforeImage??"",
                      fit: BoxFit.fill,
                    ),
                  ),),
              Spacer(),
              Icon(Icons.forward_rounded,size: 25,color: AppColors.primaryColor,),
              Spacer(),
              Container(width: 0.3.sw,height: 0.35.sw,
                decoration: AppContainerStyle.radiusAll15,
                child:  ClipRRect(
                  borderRadius:BorderRadius.circular(15),
                  child: ImagePlaceHolder(
                    img: imageParisModel.beforeImage??"",
                    fit: BoxFit.fill,
                  ),
                ),),
            ],),
          ),
        ),
      ),
    );
  }
}


class TraineeResultsWidgetShimmer extends StatelessWidget {
  const TraineeResultsWidgetShimmer({Key? key}) : super(key: key);
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
                  width: 0.3.sw,height: 0.35.sw,
                ),
              ),
              Spacer(),
              Icon(Icons.forward_rounded,size: 25,color: AppColors.gray100,),
              Spacer(),
              ClipRRect(
                borderRadius: _border,
                child: ShimmerWidget.rectangular(
                  width: 0.3.sw,height: 0.35.sw,
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
