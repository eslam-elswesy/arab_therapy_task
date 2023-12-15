import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingController extends SuperController<dynamic> {


  @override
  void onInit() async {
    // change(false, status: RxStatus.loading());
    // // await getHomeModel();
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