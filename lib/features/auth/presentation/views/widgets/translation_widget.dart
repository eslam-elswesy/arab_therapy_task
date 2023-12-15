
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => _openLanguageDialog(context),
            child: Column(
              children: [
                SvgWidget(
                  IconsAssetsConstants.languageIcon,
                  width:  0.07.sw,
                  height:  0.07.sw,
                  fit: BoxFit.fill,
                ),
                Text(
                 "en (India)",
                  style: AppTextStyle.black_13,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openLanguageDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
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
                      SvgWidget(
                        IconsAssetsConstants.languageIcon,
                        width: 0.15.sw,
                        height: 0.15.sw,
                        fit: BoxFit.fill,
                      ),
                      ButtonWidget(
                        onTap: (){},
                        text: "English".tr,
                      ),
                      ButtonWidget(
                        padding: 6,
                        onTap: (){},
                        text: "عربي".tr,
                      ),
                      ButtonWidget(
                        onTap: (){},
                        text: "French".tr,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
