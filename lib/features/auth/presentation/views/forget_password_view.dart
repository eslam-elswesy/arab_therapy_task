import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:arab_therapy_task/core/widgets/button_widget.dart';
import 'package:arab_therapy_task/core/widgets/icon_widget.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/forget_password_controller.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/widgets/country_sheet_widget.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
                                    StringsAssetsConstants.forget_password_word,
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
                                      StringsAssetsConstants.forget_password_word_hint,
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
                                      StringsAssetsConstants.use_phone:
                                      StringsAssetsConstants.use_email,
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
                                onTap: ()=>controller.forgetPassword(context),
                                waitingAction: controller.waiting.value,
                                text: StringsAssetsConstants.reset_password),


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

