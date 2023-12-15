import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/services/validator_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/widgets/country_sheet_widget.dart';
import 'package:arab_therapy_task/features/user_controller.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/models/country_model.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';


class LoginController extends SuperController<dynamic> {
  LoginController();


  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  Rxn<String> emailError=Rxn<String>();
  Rxn<String> phoneError=Rxn<String>();
  Rxn<String> passwordError=Rxn<String>();

  RxBool waitingLogin=false.obs;
  RxBool waitingGuestUser=false.obs;


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

  Future logIn(BuildContext context) async {
    if(_validateLogIn()){
      waitingLogin.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
            endPoint: AppApiConstants.login,
            requestType: HttpRequestTypes.post,
            data: {"type": isEmailLogin.value?"email":"phone_number",isEmailLogin.value?"email":"phone_number":isEmailLogin.value?emailController.text:"${selectedCountryModel.value.phoneCode}${phoneController.text}","password":passwordController.text},
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          if(response.body['user_id']!=null)//  the user already verified his number/email by otp
          {

            Get.put(UserController()).setUser(response.body,AppConstants.tokenTypes[1],response.body['token'],response.body['refresh']);
            Get.toNamed(AppRoutes.navigator);
          }else // the user not verified his number/email by otp
          {
            Get.toNamed(AppRoutes.verification, arguments: true, parameters: {'type': isEmailLogin.value?"email":"phone_number","content":isEmailLogin.value?emailController.text:phoneController.text,"token":response.body['token']});
          }
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
        waitingLogin.value=false;
      }

    }
    change(true, status: RxStatus.success());
  }

  bool _validateLogIn() {
    emailError.value=null;
    phoneError.value=null;

    if(isEmailLogin.value){
      emailError.value = AppValidatorService.validEmail(emailController.text,customMessage: "عنوان البريد الإلكتروني غير صحيح. مثال: name@example.com");
    }
    else{
      phoneError.value = AppValidatorService.validPhone(phoneController.text,customMessage: "يرجى إدخال رقم جوال مكون من 9 أرقام.");
    }
    passwordError.value = AppValidatorService.validPassword(passwordController.text,customMessage: "يجب أن تكون كلمة المرور مكونة من 8 أحرف وأرقام على الأقل.");
    return emailError.value==null&& phoneError.value==null&&passwordError.value==null;
  }

  Future guestLogin(BuildContext context) async {
      waitingGuestUser.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.signup,
          requestType: HttpRequestTypes.post,
          data: {"type": "guest"},
        );

        if (response.statusCode == 200 && response.successFlag == true) {
            print("logIn::oooo::${response.statusCode}::${response.successFlag}");

            Get.put(UserController()).setUser(response.body,AppConstants.tokenTypes[0],response.body['token'],response.body['refresh']);
            Get.toNamed(AppRoutes.navigator);

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
        waitingGuestUser.value=false;
    }
    change(true, status: RxStatus.success());
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
