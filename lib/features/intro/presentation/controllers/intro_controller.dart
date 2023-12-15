import 'package:get/get.dart';
import 'package:arab_therapy_task/core/consts/images_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/logos_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/storage_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/services/local_storage_service.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';

class IntroController extends SuperController<dynamic> {
  IntroController();


  List<IntroModel> introList=[
    IntroModel(
      img: ImagesAssetsConstants.bg1,
      title: StringsAssetsConstants.title1,
      details:StringsAssetsConstants.details1,
    ),
    IntroModel(
      img: ImagesAssetsConstants.bg2,
      title: StringsAssetsConstants.title2,
      details:StringsAssetsConstants.details2,
    ),
    IntroModel(
      img: ImagesAssetsConstants.bg3,
      title: StringsAssetsConstants.title3,
      details:StringsAssetsConstants.details3,
    ),
  ];

  RxInt currentStep=0.obs;

  void  changeCurrentStep(){
    if(currentStep.value==2){
      Get.toNamed(AppRoutes.login);
      skip();
    }
    else{
      currentStep.value++;
      change(true, status: RxStatus.success());
    }

  }

  void skip(){
    LocalStorageService.postData(
        key: AppStorageKeys.isFirstTime, value: false, type: DataType.bool);
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


class IntroModel{
  String img;
  String title;
  String details;

  IntroModel({required this.details,required this.img,required this.title});
}
