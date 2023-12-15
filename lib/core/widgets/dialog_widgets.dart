import 'dart:io';

import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';

class DialogWidget{


 // static showToast(BuildContext context, String message) {
 //    FToast flutterToast = FToast();
 //    flutterToast.init(context);
 //    flutterToast.showToast(
 //      child: Container(
 //        width: 1.sw,
 //        decoration: BoxDecoration(
 //            color: AppColors.black.withOpacity(0.7),
 //            borderRadius: BorderRadius.circular(10)
 //        ),
 //        child:  Padding(
 //          padding: const EdgeInsets.all(10.0),
 //          child: Text(
 //            message,
 //            style: AppTextStyle.white_13,
 //          ),
 //        ),
 //      ),
 //      gravity: ToastGravity.BOTTOM,
 //      toastDuration: Duration(seconds: 3),
 //    );
 //  }

  //type -> confirm, warning
 static Future<dynamic> confirmDialog(BuildContext context,{required String type,required Function agreeFunction,required String title,required String body,bool isSingleBackButton=false,bool isDismissable=true})  {
   return  showDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (context) =>  AlertDialog(

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        icon:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgWidget(
              type==AppConstants.dialogTypes[0]? IconsAssetsConstants.done:IconsAssetsConstants.warning,
              width: 0.15.sw,
              height: 0.15.sw,
              fit: BoxFit.fill,
            ),
          ],
        ),
        title:  Text(title),
        titleTextStyle: AppTextStyle.black_13BOLD.copyWith(
          color: AppColors.secondaryColor,
          fontFamily: AppConstants.fontFamily
        ),
        content:  Text(body,
        textAlign: TextAlign.center,),
        contentTextStyle: AppTextStyle.darkGrey_13.copyWith(
            fontFamily: AppConstants.fontFamily
        ),
        actions:isSingleBackButton? <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ButtonWidget(onTap: (){
              Navigator.of(context).pop(false);
              agreeFunction(true);
            },
                width: 0.65.sw,
                btnColor: AppColors.transparentColor,
                textColor: AppColors.delete,
                borderColor: AppColors.delete,
                text: StringsAssetsConstants.edit),
          )
        ]:type==AppConstants.dialogTypes[0]? <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ButtonWidget(onTap: (){
              Navigator.of(context).pop(false);
              agreeFunction(true);
            },
                width: 0.65.sw,
                btnColor: AppColors.transparentColor,
                textColor: AppColors.primaryColor,
                text: StringsAssetsConstants.agree),
          )
        ]:<Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ButtonWidget(onTap: (){},
                width: 0.3.sw,
                btnColor: AppColors.delete,
                borderColor: AppColors.delete,
                textColor: AppColors.white,
                text: StringsAssetsConstants.yes),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ButtonWidget(onTap: (){},
                width: 0.3.sw,
                btnColor: AppColors.transparentColor,
                textColor: AppColors.secondaryColor,
                borderColor: AppColors.gray300,
                text: StringsAssetsConstants.no),
          )
        ],
      ),
    );
  }

 static Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        title:  Text("closeApp".tr,style: AppTextStyle.main_14(context).copyWith(
          fontWeight: FontWeight.bold
        )),
        content:  Text("closeAppTXT".tr,style:AppTextStyle.main_14(context),),
        actions: <Widget>[
           ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:  Text('no'.tr),
          ),
           ElevatedButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child:  Text('yes'.tr),
          ),
        ],
      ),
    )) ??
        false;
  }

}