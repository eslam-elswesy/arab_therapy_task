import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/services/validator_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/features/user_controller.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';


class VerificationController extends SuperController<dynamic> {

  late String verificationType;
  late String verificationContent;
  late String userToken;
  VerificationController({required String token,required String type,required String content}){
    userToken=token;
    verificationType=type;
    verificationContent=content;
  }


  TextEditingController otpController= TextEditingController();

  Rxn<String> otpError=Rxn<String>();


  RxBool waiting=false.obs;
  RxBool waitingResend=false.obs;



  Future verificationCode(BuildContext context) async {

    if(_validateCode()){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.verificationCode,
          requestType: HttpRequestTypes.post,
          data: {"otp": otpController.text,},
          header: {
            "Accept": "application/json",
            "Content-type": "application/json",
            "Accept-Language": Get.locale?.languageCode ?? "en",
            "X-Tadreab-Token":userToken
          }
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          if(verificationType=="forget_password"){
            Get.toNamed(AppRoutes.restPassword,arguments: true, parameters: {"token":response.body['reset_password_token']});
          }
          else{
            Get.put(UserController()).setUser(response.body,AppConstants.tokenTypes[1],response.body['token'],response.body['refresh']);
            Get.toNamed(AppRoutes.navigator);
          }

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
      } finally {
        waiting.value=false;
      }
    }
    change(true, status: RxStatus.success());
  }


  Future resendVerificationCode(BuildContext context) async {


    waitingResend.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.resendOTP,
          requestType: HttpRequestTypes.get,
          header: {
            "Accept": "application/json",
            "Content-type": "application/json",
            "Accept-Language": Get.locale?.languageCode ?? "en",
            "X-Tadreab-Token":userToken
          }
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          DialogWidget.confirmDialog(
              context,
              type: AppConstants.dialogTypes[0],
              agreeFunction: (bool){},
              title: StringsAssetsConstants.done,
              body: StringsAssetsConstants.resend_otp_done,
              isSingleBackButton: false
          );

        }
        else {
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
      } finally {
        waitingResend.value=false;
      }
    change(true, status: RxStatus.success());
  }




  bool _validateCode() {
    otpError.value = AppValidatorService.validLenth(otpController.text,4,customMessage: "كود التفعيل غير صحيح");
    return otpError.value==null;
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
