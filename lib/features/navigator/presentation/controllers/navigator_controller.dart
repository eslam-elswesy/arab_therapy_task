import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/features/account/presentation/view/account_view.dart';
import 'package:arab_therapy_task/features/home/presentation/view/home_view.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/meals_view.dart';
import 'package:arab_therapy_task/features/tadreab/presentation/view/tadreab_view.dart';
import 'package:arab_therapy_task/features/traning/presentation/view/training_view.dart';
import 'package:arab_therapy_task/line_chart.dart';

class NavigatorController extends SuperController<dynamic> {

  List<Widget> screens=[HomeView(),TrainingView(),TadreabView(),MealsView(),AccountView()];
  RxInt selectedScreenIndex=0.obs;
  Future changeSelectedIndex(int index) async {
    selectedScreenIndex.value=index;
    change(true, status: RxStatus.success());
  }
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