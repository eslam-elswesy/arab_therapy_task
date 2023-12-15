
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';

class AppleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //     onTap: initiateGmailLogin,
    //     child: SvgWidget(
    //       IconsAssetsConstants.apple,
    //       width:  0.08.sw,
    //       height: 0.08.sw,
    //       fit: BoxFit.fill,
    //     ));
    return SvgWidget(IconsAssetsConstants.apple,width: 0.1.sw,height: 0.1.sw,) ;

    // return ButtonWidget(onTap: initiateGmailLogin, text: "googleLogin",icon: SvgWidget(AppAssets.google),btnColor: AppColors.white,borderColor: AppColors.white,textColor: AppColors.black,);
  }

  void initiateGmailLogin() async {
    // GoogleSignIn _googleSignIn = GoogleSignIn(
    //   scopes: [
    //     'email',
    //     'https://www.googleapis.com/auth/contacts.readonly',
    //   ],
    // );
    // try {
    //   var returnData =await _googleSignIn.signIn();
    //   print("GG::Success::${returnData.email}::${returnData.displayName}::${returnData.photoUrl}::${returnData.id}::${returnData.authentication}");
    //
    //   //socialData["name"], socialData["email"], socialData["id"], socialData["id"]
    //   Map<dynamic,dynamic> profile={
    //     "name":returnData.displayName,
    //     "email":returnData.email,
    //     "id":returnData.id,
    //   };
    //   Get.put<LoginController>(LoginController()).login(returnData.email, returnData.id,isSocialLogin: true,socialData: profile);
    //
    // } catch (error) {
    //   print("GG::ERROR::$error");
    // }
  }
}
