import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';

class ImageInputPlaceHolder extends StatefulWidget {
  String? img, holder;
  Function? saveImage;
  PickedFile? imageFile;

  ImageInputPlaceHolder({super.key, this.img, this.holder, this.saveImage, this.imageFile});

  @override
  _ImageInputPlaceHolderState createState() => _ImageInputPlaceHolderState();
}

class _ImageInputPlaceHolderState extends State<ImageInputPlaceHolder> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    if (widget.imageFile != null) {
      return GestureDetector(
        onTap: () => _showChooses(context),
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.file(
                      File(widget.imageFile!.path),
                      height: 0.15.sh,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: ContainerRadiusAll10.copyWith(color: AppColors.primaryColor),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "update",
                          style: AppTextStyle.white_14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => _showChooses(context),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: FadeInImage.assetNetwork(
                  placeholder: widget.holder!,
                  image: widget.img!,
                  fit: BoxFit.fill,
                  imageErrorBuilder: (context, url, error) => Image.asset(widget.holder!),
                  height:  0.15.sh,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: AppContainerStyle.radiusAll8Shadow.copyWith(color: AppColors.primaryColor),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "update",
                          style: AppTextStyle.white_13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  _showChooses(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10.5),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () => _getImage(ImageSource.camera),
                  //_getImage(context,ImageSource.camera),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.camera,
                        color: Colors.amber,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('Camera'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                OutlinedButton(
                  onPressed: () => _getImage(ImageSource.gallery),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.image,
                        color: Colors.deepPurple,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('Gallery'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  _getImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      widget.imageFile = pickedFile;
      widget.saveImage!(pickedFile);
    });
    Navigator.pop(context);
  }
}
