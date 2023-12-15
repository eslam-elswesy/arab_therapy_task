import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/images_part/image_place_holder.dart';
import 'package:arab_therapy_task/features/intro/presentation/views/widgets/dot_row_widget.dart';

// IMAGE SLIDER
class CompareImageSlider extends StatefulWidget {
  List<String> imgs;
  CompareImageSlider(this.imgs);
  @override
  _CompareImageSliderState createState() => _CompareImageSliderState();
}

class _CompareImageSliderState extends State<CompareImageSlider> {



  CarouselController carouselController = CarouselController();

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          children: [
        _displayImages(context,carouselController), // display the
        Positioned(
            top: 0.06.sh,
            right: 0.05.sw,
            child: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Container(
                decoration: AppContainerStyle.circel.copyWith(
                  color: AppColors.backButtonColor.withOpacity(0.8)
                ),
                width: 0.04.sh,
                height: 0.04.sh,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SvgWidget(
                        IconsAssetsConstants.backArrow
                    ),
                  )
                ),
              ),
            )),// images
        Positioned(
            bottom: 0.05.sh,
            left: 0,right: 0,
            child: DotRowWidget(selectedStep: currentIndex,count: widget.imgs.length,color: AppColors.transparentColor,)),

      ]),
    );
  }

  //help functons
  //////////////////////////////////////////

// dynamic count and generate the dots number of images
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

//create full screen Carousel with context
  CarouselSlider _displayImages(BuildContext mediaContext,CarouselController carouselController) {
    carouselController.animateToPage(currentIndex);
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
        height: 1.sh,
        // scrollPhysics: NeverScrollableScrollPhysics(),
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      carouselController: carouselController,
      items: widget.imgs.map(
            (url) {
          return Container(
            color: AppColors.primaryColor,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(0)),
              child: ImagePlaceHolder(
                img: url,
                height: 1.sh,
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
