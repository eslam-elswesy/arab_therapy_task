import 'package:flutter/cupertino.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';

class ImagePlaceHolder extends StatelessWidget {
  String img;
  String?  holder;
  double? height, width;
  BoxFit? fit;
  ImagePlaceHolder({
    super.key,
   required this.img,
    this.height,
    this.width,
    this.holder,
    this.fit,
  });
  @override
  Widget build(BuildContext context) {
    // print("BB::$img");
    return FadeInImage.assetNetwork(
      placeholder: holder ?? ImagesAssetsConstants.logo,
      image: img ,
      height: height,
      width: width,
      imageErrorBuilder: (context, url, error) => Image.asset(
        holder?? ImagesAssetsConstants.logo,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fill,
      ),
      fit: fit ?? BoxFit.fill,
    );
  }
}
