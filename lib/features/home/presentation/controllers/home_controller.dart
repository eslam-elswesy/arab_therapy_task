import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/features/user_controller.dart';
import 'package:arab_therapy_task/models/advice_model.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/models/coach_model.dart';
import 'package:arab_therapy_task/models/image_paris_model.dart';
import 'package:arab_therapy_task/models/user_info_model.dart';

class HomeController extends SuperController<dynamic> {

  RxBool waitingUserInfo=false.obs;
  RxBool waitingGetCoachs=false.obs;
  RxBool waitingGetAdvice=false.obs;
  RxBool waitingGetImageParis=false.obs;


  Rx<UserInfoModel> userInfoModel= UserInfoModel().obs;

  List<CoachModel> coachList=[];
  List<AdviceModel> adviceList=[];
  List<ImageParisModel> imageParisList=[];


  final TextEditingController stepsController = TextEditingController();
  final TextEditingController searchAdvicesController = TextEditingController();


  Future getUserInfo(BuildContext context) async {
    waitingUserInfo.value=true;
    change(true, status: RxStatus.success());

    try {
      ApiResponse response = await HttpClientService.sendRequest(
        endPoint: AppApiConstants.getUserInfo,
        requestType: HttpRequestTypes.get,
      );
      if (response.statusCode == 200 && response.successFlag == true) {
        userInfoModel.value =UserInfoModel.fromJson(response.body);
        print("getUserInfo::success::oooo::${response.statusCode}::${response.body}");
      }
    } catch (error) {
      print("getUserInfo::oooo::ERROR::${error.toString()})");
    } finally {
      waitingUserInfo.value=false;
    }

    change(true, status: RxStatus.success());
  }

  Future _getCoaches(BuildContext context) async {
      waitingGetCoachs.value=true;
      change(true, status: RxStatus.success());

      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.getCoaches,
          requestType: HttpRequestTypes.get,
        );
        coachList.clear();
        if (response.statusCode == 200 && response.successFlag == true) {
          print("logIn::oooo::${response.statusCode}::${response.successFlag}");
          for(final coach in response.body){
            coachList.add(CoachModel.fromJson(coach));
          }
        } else {
          print("logIn::oooo::ERROR::${response.error})");
          String errorString=response.error.toString().toLowerCase();
          DialogWidget.confirmDialog(
              context,
              type: AppConstants.dialogTypes[1],
              agreeFunction: (bool){
                if(response.statusCode==401){
                  Get.put(UserController()).clearUser();
                }
              },
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
        waitingGetCoachs.value=false;
      }

    change(true, status: RxStatus.success());
  }


  RxInt advicePage=1.obs;

  Future _getAdvices(BuildContext context) async {
    waitingGetAdvice.value=true;
    change(true, status: RxStatus.success());

    try {
      ApiResponse response = await HttpClientService.sendRequest(
        endPoint: "${AppApiConstants.getAdvices}${advicePage.value}",
        requestType: HttpRequestTypes.get,
      );
      adviceList.clear();
      if (response.statusCode == 200 && response.successFlag == true) {
        print("_getAdvices::oooo::${response.statusCode}::${response.body}");
        for(final advice in response.body['items']){
          adviceList.add(AdviceModel.fromJson(advice));
        }
      } else {
        print("getAdvices::oooo::ERROR::${response.error})");
        String errorString=response.error.toString().toLowerCase();
        DialogWidget.confirmDialog(
            context,
            type: AppConstants.dialogTypes[1],
            agreeFunction: (bool){
              // if(response.statusCode==401){
              //   Get.put(UserController()).clearUser();
              // }
            },
            title: StringsAssetsConstants.error,
            body: errorString.tr,
            isSingleBackButton: true
        );
      }
    } catch (error) {
      print("getAdvices::oooo::ERROR::${error.toString()})");
      DialogWidget.confirmDialog(
          context,
          type: AppConstants.dialogTypes[1],
          agreeFunction: (bool){},
          title: StringsAssetsConstants.error,
          body: StringsAssetsConstants.server_error,
          isSingleBackButton: true
      );
    } finally {
      waitingGetAdvice.value=false;
    }
    change(true, status: RxStatus.success());
  }


  RxInt imagePairsPage=1.obs;

  Future _getImagePairs(BuildContext context) async {
    waitingGetImageParis.value=true;
    change(true, status: RxStatus.success());

    try {
      ApiResponse response = await HttpClientService.sendRequest(
        endPoint: "${AppApiConstants.getImagePairs}${imagePairsPage.value}",
        requestType: HttpRequestTypes.get,
      );
      imageParisList.clear();
      if (response.statusCode == 200 && response.successFlag == true) {
        print("logIn::oooo::${response.statusCode}::${response.successFlag}");
        for(final advice in response.body['items']){
          imageParisList.add(ImageParisModel.fromJson(advice));
        }
      } else {
        print("getAdvices::oooo::ERROR::${response.error})");
        String errorString=response.error.toString().toLowerCase();
        DialogWidget.confirmDialog(
            context,
            type: AppConstants.dialogTypes[1],
            agreeFunction: (bool){
              // if(response.statusCode==401){
              //   Get.put(UserController()).clearUser();
              // }
            },
            title: StringsAssetsConstants.error,
            body: errorString.tr,
            isSingleBackButton: true
        );
      }
    } catch (error) {
      print("getAdvices::oooo::ERROR::${error.toString()})");
      DialogWidget.confirmDialog(
          context,
          type: AppConstants.dialogTypes[1],
          agreeFunction: (bool){},
          title: StringsAssetsConstants.error,
          body: StringsAssetsConstants.server_error,
          isSingleBackButton: true
      );
    } finally {
      waitingGetImageParis.value=false;
    }
    change(true, status: RxStatus.success());
  }


  RxInt selectedWater= 0.obs;
  final ItemScrollController waterScrollController = ItemScrollController();
  Future changeSelectedWater(int selected,{bool? notUpdate}) async {
    selectedWater.value=selected;
    waterScrollController.scrollTo(duration: Duration(milliseconds: 50),index:selectedWater.value==0?selectedWater.value: selectedWater.value-1);
    change(notUpdate??true, status: RxStatus.success());
  }

  // 'name',
  // 'country',
  // 'current_calories',
  // 'current_carbs',
  // 'current_protein',
  // 'current_fat',
  // 'current_water',
  // 'current_sleep',
  // 'active_rate',
  // 'height',
  // 'weight',
  // 'gender',
  // 'age',
  // 'goal',
  // 'allergy',
  // 'injury',
  // 'measurements',
  // 'workout_place',
  // 'workout_equipment',
  // 'workout_days',
  // 'cardio_days',


  Future updateUserInfo(BuildContext context,{required String screenName,dynamic data}) async {

    waitingUserInfo.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.updateTrainee,
          requestType: HttpRequestTypes.post,
          data:data,
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("${AppApiConstants.updateTrainee}::oooo::${response.statusCode}::${response.successFlag}");
          getUserInfo(context);
          Navigator.pop(context);
          if(screenName=="water"){
            DialogWidget.confirmDialog(
                context,
                type: AppConstants.dialogTypes[0],
                agreeFunction: (bool){
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                title: StringsAssetsConstants.done,
                body: StringsAssetsConstants.water_done,
                // isSingleBackButton: true
            );

          }

        } else {
          print("logIn::oooo::else::${response.error})");
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
        waitingUserInfo.value=false;
      }

    change(true, status: RxStatus.success());
  }

  List<AdviceModel> filterAdviceList(String value) {
    List<AdviceModel> searched=[];
    for(final i in adviceList){
      if(i.topic!=null&&i.topic!.contains(value)){
        searched.add(i);
      }
    }
    change(true, status: RxStatus.success());
    return searched;
  }

  @override
  void onInit() async {
    getUserInfo(Get.context!);
    _getCoaches(Get.context!);
    _getAdvices(Get.context!);
    _getImagePairs(Get.context!);
    change(true, status: RxStatus.success());

    super.onInit();
  }
  @override
  void onPaused() {
    // TODO: implement onPaused
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
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }


}