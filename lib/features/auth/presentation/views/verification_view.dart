import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  controller.obx(
          (snap) =>
          Scaffold(
              backgroundColor: AppColors.white,
              body:SafeArea(
                top: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(18.h),
                      child:  SvgWidget(LogosAssetsConstants.wideLogo,
                        width: 0.5.sw,
                        height: 0.08.sh,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 1.sw,
                            ),
                            Container(
                              width: 0.9.sw,
                              child: RichText(
                                text: TextSpan(
                                  text:  "",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: <TextSpan>[
                                     TextSpan(
                                        text:  StringsAssetsConstants.we_send_otp_code,
                                        style: AppTextStyle.grey_14BOLD.copyWith(
                                            fontFamily: AppConstants.fontFamily,
                                            color: AppColors.gray500
                                        )),
                                    TextSpan(
                                        text: controller.verificationContent??"",
                                        style: AppTextStyle.darkGrey_14BOLD.copyWith(
                                            fontFamily: AppConstants.fontFamily,
                                          color: AppColors.secondaryColor
                                        )),
                                    if(controller.verificationType!="forget_password")
                                    TextSpan(
                                        text:  " ${StringsAssetsConstants.edit} ",
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          Navigator.pop(context);
                                        },
                                        style: AppTextStyle.darkGrey_14BOLD.copyWith(
                                          color: AppColors.primaryColor,
                                          fontFamily: AppConstants.fontFamily
                                        )),

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 0.9.sw,
                              child: Row(
                                children: [
                                  Text(
                                    StringsAssetsConstants.we_send_otp_hint,
                                    style: AppTextStyle.darkGrey_13.copyWith(
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.02.sh,
                            ),
                            TextFieldWidget(
                              filled: false,
                              label:  StringsAssetsConstants.enter_otp,
                              hint: StringsAssetsConstants.enter_otp,
                              controller: controller.otpController,
                              error: controller.otpError.value,
                              isLabelOutside:true,
                              textInputType: TextInputType.phone,
                            ),
                            Container(
                              height: 0.02.sh,
                            ),
                            ButtonWidget(
                                width: 0.9.sw,
                                onTap: ()=>controller.verificationCode(context),
                                waitingAction: controller.waiting.value,
                                text: StringsAssetsConstants.active),
                            Container(
                              height: 0.03.sh,
                            ),
                            controller.waitingResend.value?
                            Center(child: CircularProgressIndicator(backgroundColor: AppColors.white,)):
                            InkWell(
                              onTap: ()=>controller.resendVerificationCode(context),
                              child: Container(
                                width: 0.9.sw,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        StringsAssetsConstants.dont_recieve,
                                        style: AppTextStyle.darkGrey_14
                                    ),
                                    Text(
                                      StringsAssetsConstants.send_again,
                                      style: AppTextStyle.black_14.copyWith(
                                          color: AppColors.primaryColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
      onLoading: Container(
        height: 0.8.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SpinKitFadingFour(
                color: AppColors.primaryColor,
                size: 70.r,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

