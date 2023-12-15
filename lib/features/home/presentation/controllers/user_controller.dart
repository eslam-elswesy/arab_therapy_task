import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:arab_therapy_task/core/consts/storage_constants.dart';
import 'package:arab_therapy_task/core/services/local_storage_service.dart';
import 'package:arab_therapy_task/models/user_model.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {

  UserModel? user;
  String? token;
  String? tokenType;

  void setUser(dynamic user,String tokenType,String? token,String? refreshToken) {
    if(user!=null&&token!=null){
      this.user =UserModel.fromJson(user) ;
      this.token =token ;
      this.tokenType =tokenType;
      // LocalStorageService.postData(key: AppStorageKeys.userDataBox, value: jsonEncode(this.user!.toJson()), type: DataType.string);
      // LocalStorageService.postData(key: AppStorageKeys.userToken, value: token, type: DataType.string);
      // LocalStorageService.postData(key: AppStorageKeys.userRefreshToken, value: refreshToken??"", type: DataType.string);
      // LocalStorageService.postData(key: AppStorageKeys.tokenType, value:tokenType.toString(), type: DataType.string);
    }

  }

  initialize({String? routeScreen}) async {
    // bool isFirstTime=await LocalStorageService.getData(key: AppStorageKeys.isFirstTime, type: DataType.bool)??true;

    if(routeScreen==AppRoutes.splash){
      await Future.delayed(const Duration(seconds: 4));
    }
    // if (await LocalStorageService.getData(key: AppStorageKeys.userToken, type: DataType.string) != null) {
    //
    //   user = UserModel.fromJson(
    //       jsonDecode(await LocalStorageService.getData(key: AppStorageKeys.userDataBox, type: DataType.string)));
    //   token=await LocalStorageService.getData(key: AppStorageKeys.userToken, type: DataType.string);
    //   tokenType=await LocalStorageService.getData(key: AppStorageKeys.tokenType, type: DataType.string);
    //   print("TTT::${user!.name}::${token}");
    //   Get.offAllNamed(AppRoutes.navigator);
    // }
    // else if(isFirstTime){
    //   Get.offAllNamed(AppRoutes.intro);
    // }
    // else{
      Get.offAllNamed(AppRoutes.home);
    // }
  }

  void clearUser() {
    // LocalStorageService.removeData(key: AppStorageKeys.userDataBox);
    // LocalStorageService.removeData(key: AppStorageKeys.userToken);
    // LocalStorageService.removeData(key: AppStorageKeys.tokenType);
    Get.offAllNamed(AppRoutes.splash);
  }
}
