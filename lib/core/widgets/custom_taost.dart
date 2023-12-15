import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';

class DialogGeneral{
  static intToast(BuildContext context ){
    // flutterToast.init(context);
  }

 static showToast(BuildContext context,String message) {
    FToast flutterToast = FToast();
   flutterToast.init(context);
    flutterToast.showToast(
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(color: AppColors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '$message',
            style: AppTextStyle.black_14.copyWith(color: AppColors.gray200),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

 static Future<bool> FN_showDetails_Dialog(BuildContext context, String title, String body) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: <Widget>[
          new ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text(1 > 0 ? 'Okay' : "حسنا"),
          ),
//          new FlatButton(
//            onPressed: () => Navigator.of(context).pop(true),
//            child: new Text('Yes'),
//          ),
        ],
      ),
    )) ??
        false;
  }

 static Future<bool?> FN_confirm_Dialog(BuildContext context, Function() action, String title, String body) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: <Widget>[
          new ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
              action();
              //return true;
            },
            child: new Text('Okay'),
          ),
          new ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: new Text('cancel'),
          ),
        ],
      ),
    );
  }

 static Future<bool> FN_onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text("closeApp".tr, style: AppTextStyle.black_14BOLD),
        content: new Text(
          "closeAppTXT".tr,
          style: AppTextStyle.black_14,
        ),
        actions: <Widget>[
          new ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('no'.tr,style: AppTextStyle.white_14,),
          ),
          new ElevatedButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: new Text('yes'.tr,style: AppTextStyle.white_14,),
          ),
        ],
      ),
    )) ??
        false;
  }
}
