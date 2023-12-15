import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/services/validator_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/widgets/country_sheet_widget.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/models/country_model.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';


class ForgetPasswordController extends SuperController<dynamic> {


  ForgetPasswordController();


  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();


  Rxn<String> emailError=Rxn<String>();
  Rxn<String> phoneError=Rxn<String>();

  RxBool waiting=false.obs;

  RxBool isEmailLogin=true.obs;
  Future changeIsEmailLogin() async {
    isEmailLogin.value=!isEmailLogin.value;
    change(true, status: RxStatus.success());
  }

  Rx<CountryModel> selectedCountryModel=countryList[0].obs;
  Future changeSelectedCountry(CountryModel countryModel) async {
    selectedCountryModel.value=countryModel;
    change(true, status: RxStatus.success());
  }


  Future forgetPassword(BuildContext context) async {
    if(_validateForgetPassword()){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.forgotPassword,
          requestType: HttpRequestTypes.post,
          data: {"type": isEmailLogin.value?"email":"phone_number",isEmailLogin.value?"email":"phone_number":isEmailLogin.value?emailController.text:"${selectedCountryModel.value.phoneCode}${phoneController.text}"},
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          Get.toNamed(AppRoutes.verification, arguments: true, parameters: {'type': "forget_password","content":isEmailLogin.value?emailController.text:phoneController.text,"token":response.body['token']});
        } else {
          print("logIn::oooo::ERROR::${response.error})");
          String errorString=response.error.toString().toLowerCase();
          // DialogWidget.showToast(context, errorString.tr);
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

  bool _validateForgetPassword() {
    emailError.value=null;
    phoneError.value=null;

    if(isEmailLogin.value){
      emailError.value = AppValidatorService.validEmail(emailController.text,customMessage: "عنوان البريد الإلكتروني غير صحيح. مثال: name@example.com");
    }
    else{
      phoneError.value = AppValidatorService.validPhone(phoneController.text,customMessage: "يرجى إدخال رقم جوال مكون من 9 أرقام.");
    }
    return emailError.value==null&& phoneError.value==null;
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
