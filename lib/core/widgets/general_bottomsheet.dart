import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';

void OpenGeneralBottomSheet(BuildContext context,String txt,Function yesFunction,Function noFunction) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                bottom: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: AppContainerStyle.circel,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(IconsAssetsConstants.warning,fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        txt,
                        style: AppTextStyle.black_15,
                      ),
                    ),
                    ButtonWidget(
                      onTap: ()=>yesFunction(),
                      text: "yes",
                    ),
                    ButtonWidget(
                      onTap: ()=>noFunction(),
                      text: "no",
                      btnColor: AppColors.white,
                      borderColor: AppColors.delete,
                      textColor: AppColors.delete,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}


