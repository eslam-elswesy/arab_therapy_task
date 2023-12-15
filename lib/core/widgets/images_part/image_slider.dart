import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/intro/presentation/views/widgets/dot_row_widget.dart';

class MainImageSlider extends StatefulWidget {
  List<String> imgs;
  MainImageSlider(this.imgs, {super.key}); //constractor
  @override
  _MainImageSliderState createState() => _MainImageSliderState();
}

class _MainImageSliderState extends State<MainImageSlider> {
  // to change the dots indecator
  int _current = 0;
  // to change the colors of buttons
  Color star = Colors.white;
  Color share = Colors.white;
  Color back = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _displayImages(context), // display the images
      Positioned(
          bottom: 0.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(widget.imgs, (index, url) {
              return Container(
                width: _current == index ? 16 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: _current == index
                    ? BoxDecoration(borderRadius: BorderRadius.circular(180), color: AppColors.errorColor(context))
                    : const BoxDecoration(shape: BoxShape.circle, color: AppColors.gray500),
              );
            }),
          )),
    ]);
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
  CarouselSlider _displayImages(BuildContext mediaContext) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        height: 0.28.sh,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: widget.imgs.map(
        (url) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 10,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: FadeInImage.assetNetwork(
                  placeholder: "ICON_LOGO",
                  image: url,
                  height: 1.sh,
                  width: 1.sw,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

// IMAGE SLIDER
class ImageSlider extends StatefulWidget {
  List<String> imgs;
  int current ;
  ImageSlider(this.imgs, {super.key,required this.current});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  Color star = Colors.white;
  Color share = Colors.white;
  Color back = Colors.white;

  CarouselController carouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _displayImages(context,carouselController), // display the images
      DotRowWidget(selectedStep: widget.current,count: widget.imgs.length,),

    ]);
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
    carouselController.animateToPage(widget.current);
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        height: 0.5.sh,
        scrollPhysics: NeverScrollableScrollPhysics(),
        onPageChanged: (index, reason) {
          // setState(() {
          //   widget.current = index;
          // });
        },
      ),
      carouselController: carouselController,
      items: widget.imgs.map(
        (url) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            child: Image.asset(
              url,
              height: 0.35.sh,
              width: 1.sw,
              fit: BoxFit.cover,
            ),
          );
        },
      ).toList(),
    );
  }
}
