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


class SignUpController extends SuperController<dynamic> {
  SignUpController();


  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmPasswordController= TextEditingController();

  Rxn<String> emailError=Rxn<String>();
  Rxn<String> phoneError=Rxn<String>();
  Rxn<String> nameError=Rxn<String>();
  Rxn<String> passwordError=Rxn<String>();
  Rxn<String> confirmPasswordError=Rxn<String>();
  // Rxn<String> termsError=Rxn<String>();


  // RxBool acceptTerms=false.obs;
  // Future changeAcceptTerms(bool value) async {
  //   acceptTerms.value=value;
  //   change(true, status: RxStatus.success());
  // }


  RxBool waiting=false.obs;

  RxBool showPassword=false.obs;
  Future changeShowPassword() async {
    showPassword.value=!showPassword.value;
    change(true, status: RxStatus.success());
  }


  RxBool isEmailLogin=false.obs;
  Future changeIsEmailLogin() async {
    isEmailLogin.value=!isEmailLogin.value;
    change(true, status: RxStatus.success());
  }

  Rx<CountryModel> selectedCountryModel=countryList[0].obs;
  Future changeSelectedCountry(CountryModel countryModel) async {
    selectedCountryModel.value=countryModel;
    change(true, status: RxStatus.success());
  }

  Future signUP(BuildContext context) async {

    if(_validateSignUp()){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.signup,
          requestType: HttpRequestTypes.post,
          data: {"type": isEmailLogin.value?"email":"phone_number","name":nameController.text,isEmailLogin.value?"email":"phone_number":isEmailLogin.value?emailController.text:"${selectedCountryModel.value.phoneCode}${phoneController.text}","password":passwordController.text},
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          Get.toNamed(AppRoutes.verification, arguments: true, parameters: {'type': isEmailLogin.value?"email":"phone","content":isEmailLogin.value?emailController.text:phoneController.text,"token":response.body['token']});
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

  bool _validateSignUp() {
    emailError.value=null;
    phoneError.value=null;

    if(isEmailLogin.value){
      emailError.value = AppValidatorService.validEmail(emailController.text,customMessage: "عنوان البريد الإلكتروني غير صحيح. مثال: name@example.com");
    }
    else{
      phoneError.value = AppValidatorService.validPhone(phoneController.text,customMessage: "يرجى إدخال رقم جوال مكون من 9 أرقام.");
    }
    passwordError.value = AppValidatorService.validPassword(passwordController.text,customMessage: "يجب أن تكون كلمة المرور مكونة من 8 أحرف وأرقام على الأقل.");
    nameError.value = AppValidatorService.validName(nameController.text,customMessage: "الاسم يجب ألا يحتوي على أرقام أو رموز");
    confirmPasswordError.value = AppValidatorService.validConfPass(confirmPasswordController.text,passwordController.text,customMessage: "كلمات المرور غير متطابقة.");
    return emailError.value==null&&nameError.value==null&&passwordError.value==null&&confirmPasswordError.value==null;
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
