import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/services/validator_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';


class RestPasswordController extends SuperController<dynamic> {

  late String userToken;
  RestPasswordController({required String token}){
    userToken=token;

  }

  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmPasswordController= TextEditingController();


  Rxn<String> passwordError=Rxn<String>();
  Rxn<String> confirmPasswordError=Rxn<String>();

  RxBool waiting=false.obs;

  RxBool showPassword=false.obs;
  Future changeShowPassword() async {
    showPassword.value=!showPassword.value;
    change(true, status: RxStatus.success());
  }

  Future resetPassword(BuildContext context) async {

    if(_validateResetPassword()){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.resetPassword,
          requestType: HttpRequestTypes.post,
          data: {"password": passwordController.text},
            header: {
              "Accept": "application/json",
              "Content-type": "application/json",
              "Accept-Language": Get.locale?.languageCode ?? "en",
              "X-Tadreab-Token":userToken
            }
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          DialogWidget.confirmDialog(context,
            type: AppConstants.dialogTypes[0],
            agreeFunction: (bool)=>Get.offAllNamed(AppRoutes.login),
            title: StringsAssetsConstants.success_reset_password,
            body: StringsAssetsConstants.success_reset_password_hint,
            isDismissable: false
          );
        } else {
          print("logIn::oooo::ERROR::${response.error})");
          String errorString=response.error.toString().toLowerCase();
          DialogWidget.confirmDialog(
              context,
              type: AppConstants.dialogTypes[1],
              agreeFunction: (bool){},
              title: StringsAssetsConstants.error,
              body: errorString.tr,
              isSingleBackButton: true
          );
        }
      } catch (error) {
        print("logIn::oooo::ERROR::${error.toString()})");
        DialogWidget.confirmDialog(
            context,
            type: AppConstants.dialogTypes[1],
            agreeFunction: (bool){},
            title: StringsAssetsConstants.error,
            body: StringsAssetsConstants.server_error,
            isSingleBackButton: true
        );
        // DialogWidget.showToast(context, StringsAssetsConstants.server_error);
      } finally {
        waiting.value=false;
      }

    }
    change(true, status: RxStatus.success());
  }

  bool _validateResetPassword() {

    passwordError.value = AppValidatorService.validPassword(passwordController.text,customMessage: "يجب أن تكون كلمة المرور مكونة من 8 أحرف وأرقام على الأقل.");
    confirmPasswordError.value = AppValidatorService.validConfPass(confirmPasswordController.text,passwordController.text,customMessage: "كلمات المرور غير متطابقة.");
    return passwordError.value==null&&confirmPasswordError.value==null;
  }


  @override
  void onInit() async {
    change(true, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

}
