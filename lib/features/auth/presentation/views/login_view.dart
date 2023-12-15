import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/widgets/apple_button.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/widgets/gmail_button.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

import 'widgets/country_sheet_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                                    StringsAssetsConstants.welcome,
                                    style: AppTextStyle.black_14BOLD,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 0.9.sw,
                              child: Row(
                                children: [
                                  Text(
                                    StringsAssetsConstants.welcome_hint,
                                    style: AppTextStyle.darkGrey_13.copyWith(
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            controller.isEmailLogin.value?
                            TextFieldWidget(
                              filled: false,
                              label:  StringsAssetsConstants.email,
                              hint: StringsAssetsConstants.email_hint,
                              controller: controller.emailController,
                              error: controller.emailError.value,
                              isLabelOutside:true,
                            ):TextFieldWidget(
                              filled: false,
                              label:  StringsAssetsConstants.phone,
                              hint: StringsAssetsConstants.phone_hint,
                              controller: controller.phoneController,
                              error: controller.phoneError.value,
                              isLabelOutside:true,
                              textInputType: TextInputType.phone,
                              suffixIcon: InkWell(
                                onTap: ()=>OpenCountryBottomSheet(
                                  context,selectFunction: controller.changeSelectedCountry
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_drop_down_sharp,size: 25,color: AppColors.primaryColor,),
                                      Text("${controller.selectedCountryModel.value.phoneCode} ",
                                        style: AppTextStyle.black_13,),
                                      Image.asset(controller.selectedCountryModel.value.image,height: 25.h,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: controller.changeIsEmailLogin,
                              child: Container(
                                width: 0.9.sw,
                                child: Row(
                                  children: [
                                    Text(
                                      controller.isEmailLogin.value?
                                      StringsAssetsConstants.login_by_phone:
                                      StringsAssetsConstants.login_by_email,
                                      style: AppTextStyle.black_13.copyWith(
                                          color: AppColors.primaryColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                            InkWell(
                              onTap:()=>Get.toNamed(AppRoutes.forgetPassword),
                              child: Container(
                                width: 0.9.sw,
                                child: Row(
                                  children: [
                                    Text(
                                      StringsAssetsConstants.forget_password,
                                      style: AppTextStyle.black_13.copyWith(
                                          color: AppColors.primaryColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 0.02.sh,
                            ),
                            ButtonWidget(
                                width: 0.9.sw,
                                 onTap: ()=>controller.logIn(context),
                                waitingAction: controller.waitingLogin.value,
                                text: StringsAssetsConstants.login,
                            ),
                            ButtonWidget(
                                width: 0.9.sw,
                                onTap: ()=>controller.guestLogin(context),
                                waitingAction: controller.waitingGuestUser.value,
                                btnColor: AppColors.transparentColor,
                                borderColor: AppColors.transparentColor,
                                textColor: AppColors.primaryColor,
                                text: StringsAssetsConstants.visitor),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Container(
                                width: 0.9.sw,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 0.25.sw,
                                      height: 1,
                                      color: AppColors.gray200,
                                    ),
                                    Text(
                                        StringsAssetsConstants.or_sign_by,
                                        style: AppTextStyle.grey_13
                                    ),
                                    Container(
                                      width: 0.25.sw,
                                      height: 1,
                                      color: AppColors.gray200,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppleButton(),
                                Container(
                                  width: 0.05.sw,
                                ),
                                GmailButton()
                              ],
                            ),
                            Container(
                              height: 0.02.sh,
                            ),

                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ()=>Get.toNamed(AppRoutes.signup),
                      child: Container(
                        width: 0.9.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                StringsAssetsConstants.have_not_account,
                                style: AppTextStyle.darkGrey_14
                            ),
                            Text(
                              StringsAssetsConstants.new_signup,
                              style: AppTextStyle.black_14.copyWith(
                                  color: AppColors.primaryColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 0.02.sh,
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

