import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<RestPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

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
                              child: Row(
                                children: [
                                  Text(
                                    StringsAssetsConstants.reset_new_password,
                                    style: AppTextStyle.darkGrey_13BOLD,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 0.9.sw,
                              child: Row(
                                children: [
                                  Container(
                                    width: 0.9.sw,
                                    child: Text(
                                      StringsAssetsConstants.reset_new_password_hint,
                                      style: AppTextStyle.darkGrey_13.copyWith(
                                        color: AppColors.gray400,
                                      ),
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
                              label:  StringsAssetsConstants.password,
                              hint: StringsAssetsConstants.password_hint,
                              controller: controller.passwordController,
                              error: controller.passwordError.value,
                              // helperText: "alpha numeric, 8 or more dig/**/its",
                              isLabelOutside:true,
                              obscureText:  !controller.showPassword.value,
                              suffixIcon: InkWell(
                                onTap: ()=>controller.changeShowPassword(),
                                child: Icon(
                                  controller.showPassword.value? Icons.visibility_off_outlined:Icons.visibility_outlined,
                                  // color: AppColors.primaryColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            TextFieldWidget(
                              filled: false,
                              label:  StringsAssetsConstants.confirm_password,
                              hint: StringsAssetsConstants.confirm_password_hint,
                              controller: controller.confirmPasswordController,
                              // helperText: "alpha numeric, 8 or more digits",
                              error: controller.confirmPasswordError.value,
                              isLabelOutside:true,
                              obscureText:  !controller.showPassword.value,

                              suffixIcon: InkWell(
                                onTap: ()=>controller.changeShowPassword(),
                                child: Icon(
                                  controller.showPassword.value? Icons.visibility_off_outlined:Icons.visibility_outlined,
                                  // color: AppColors.primaryColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 0.02.sh,
                            ),
                            ButtonWidget(
                                width: 0.9.sw,
                                onTap: ()=>controller.resetPassword(context),
                                waitingAction: controller.waiting.value,
                                text: StringsAssetsConstants.confirm_password),
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

