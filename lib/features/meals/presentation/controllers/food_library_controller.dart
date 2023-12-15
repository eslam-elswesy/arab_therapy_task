import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:arab_therapy_task/core/consts/app_constants.dart';
import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/calories_calculator_service.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/core/services/validator_service.dart';
import 'package:arab_therapy_task/core/widgets/dialog_widgets.dart';
import 'package:arab_therapy_task/models/api_response.dart';

class FoodLibraryController extends SuperController<dynamic> {

  RxBool waiting=false.obs;
  TextEditingController searchController=TextEditingController();


  List<String> filterList=[
    StringsAssetsConstants.all,
    StringsAssetsConstants.drinks,
    StringsAssetsConstants.family_meals,
    StringsAssetsConstants.restaurant,
    StringsAssetsConstants.extrafood,
  ];

  RxString selectedFilter =  StringsAssetsConstants.all.obs;
  Future changeSelectedFilter(String selected) async {
    selectedFilter.value=selected;
    change(true, status: RxStatus.success());
  }


  // {"name":"value","country":"value","calories":"value","carb":"value",
  // "protein":"value","fat":"value","height":"value","weight":"value",
  // "gender":"value","age":"value","goal":"value","allergy":"value",
  // "injury":"value","measurements":"value","workout_place":"value","workout_equipment":"value",
  // "workout_days":"value","cardio_days":"value"}
  Future updateUserInfo(BuildContext context,{bool screenOfCalculateByPersonal=false}) async {
    if(screenOfCalculateByPersonal){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.updateTrainee,
          requestType: HttpRequestTypes.post,
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("${AppApiConstants.updateTrainee}::oooo::${response.statusCode}::${response.successFlag}");

          DialogWidget.confirmDialog(context,
              type: AppConstants.dialogTypes[0],
              agreeFunction: (bool){
                if(screenOfCalculateByPersonal){
                  Navigator.pop(context);
                }
                Navigator.pop(context);
              },
              title: StringsAssetsConstants.congratulation,
              body: StringsAssetsConstants.congratulation_hint,
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
      } finally {
        waiting.value=false;
      }
    }
    else{
      DialogWidget.confirmDialog(
          context,
          type: AppConstants.dialogTypes[1],
          agreeFunction: (bool){},
          title: StringsAssetsConstants.error,
          body: StringsAssetsConstants.presentage_must_by,
          isSingleBackButton: true
      );
    }

    change(true, status: RxStatus.success());
  }


  @override
  void onInit() async {

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