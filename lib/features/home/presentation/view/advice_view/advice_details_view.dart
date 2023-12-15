import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/gap_widget.dart';
import 'package:arab_therapy_task/core/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/models/advice_model.dart';


class AdviceDetailsView extends GetView<HomeController> {
  final AdviceModel adviceModel;
  const AdviceDetailsView(this.adviceModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap){
            List<String> dataString=[];
            Items? items;
            if(adviceModel.items!=null){
               items= adviceModel.items!.firstWhere((element) => element.type=="points");
            }
            if(items!=null&&items.pointsData!=null){
              dataString.addAll(items.pointsData!);
            }
            print("Csc::$dataString");

            return Scaffold(
                backgroundColor: AppColors.white,
                body:Column(
                  children: [
                    HeaderWidget(title: adviceModel.topic??"",
                        isBack: true),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            GapWidget(width: 1.sw,height: 0.02.sh,),
                            Container(
                              width: 0.9.sw,
                              height: 0.22.sh,
                              decoration: AppContainerStyle.radiusAll8,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                child: ImagePlaceHolder(
                                  img: adviceModel.mediaImage??"",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                width: 0.9.sw,
                                child: Row(
                                  children: [
                                    Text(adviceModel.topic??"",style: AppTextStyle.black_13BOLD.copyWith(
                                        color: AppColors.secondaryColor
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            if(adviceModel.items!=null&&adviceModel.items!.isNotEmpty)
                              for(final i in adviceModel.items!)
                                if(i.type=="paragraph")Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Container(
                                    width: 0.9.sw,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 0.9.sw,
                                            child: Text(i.data??"",style: AppTextStyle.darkGrey_13,)),
                                      ],
                                    ),
                                  ),
                                )
                                else if(i.type=="video")InkWell(
                                  onTap: (){},
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 0.9.sw,
                                        height: 0.22.sh,
                                        decoration: AppContainerStyle.radiusAll8,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                                          child: ImagePlaceHolder(
                                            img: adviceModel.mediaImage??"",
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(child: Center(child: Icon(Icons.not_started_sharp,size: 30,color: AppColors.primaryColor,)))
                                    ],
                                  ),
                                )
                                else if(i.type=="sub_image_url")InkWell(
                                    onTap: (){},
                                    child: Container(
                                      width: 0.7.sw,
                                      height: 0.15.sh,
                                      decoration: AppContainerStyle.radiusAll8,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        child: ImagePlaceHolder(
                                          img: adviceModel.mediaImage??"",
                                        ),
                                      ),
                                    ),
                                  ),
                            dataString.isNotEmpty?
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: dataString.length,
                              itemBuilder: (context,index)=>Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: AppContainerStyle.circel.copyWith(
                                          color: AppColors.black
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: 0.8.sw,
                                      child: Text(dataString[index]??"",style: AppTextStyle.darkGrey_13,)),
                                ],
                              ),):Container(),
                          ],
                        ),
                      ),
                    ),

                  ],
                )
            );
          }
          ,
      onLoading: Container(
        height: 0.8.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container()
            ),
          ],
        ),
      ),
    );
  }

}

