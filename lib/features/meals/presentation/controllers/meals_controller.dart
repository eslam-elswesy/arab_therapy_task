import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsController extends SuperController<dynamic> {

  RxBool waiting=false.obs;

  Rx<int> selectedDayIndex = 0.obs;

  RxInt selectedTotalQuantity= 50.obs;

  final TextEditingController quantityController = TextEditingController();

  //operation -> subtract, add
  Future changeSelectedDayIndex(int currentIndex,String operation, {bool? notUpdate}) async {
    if(operation=="add"&&currentIndex<0){
      selectedDayIndex.value=currentIndex+1;
    }
    if(operation=="subtract"&&currentIndex>-6){
      selectedDayIndex.value=currentIndex-1;
    }

    change(notUpdate??true, status: RxStatus.success());
  }

  changeTotalCalories({String? operation,bool? notUpdate}){
    if(operation=="add") selectedTotalQuantity.value=selectedTotalQuantity.value+50;
    else if(operation=="min"&&selectedTotalQuantity>50) selectedTotalQuantity.value=selectedTotalQuantity.value-50;
    else selectedTotalQuantity.value=int.parse(quantityController.text);
    quantityController.text=selectedTotalQuantity.value.toString();
    change(notUpdate??true, status: RxStatus.success());
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