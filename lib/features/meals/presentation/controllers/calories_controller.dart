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
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/models/api_response.dart';

class CaloriesController extends SuperController<dynamic> {

  RxBool waiting=false.obs;

  late TextEditingController caloriesAddController;

  RxInt selectedTotalCalories= 2000.obs;

  final ItemScrollController protienScrollController = ItemScrollController();
  final ItemScrollController carpScrollController = ItemScrollController();
  final ItemScrollController fatsScrollController = ItemScrollController();

  final ItemPositionsListener protienPositionsListener = ItemPositionsListener.create();
  final ItemPositionsListener carbPositionsListener = ItemPositionsListener.create();
  final ItemPositionsListener fatsPositionsListener = ItemPositionsListener.create();

// calculate Calories by personal info
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController targetController = TextEditingController();
  final TextEditingController activeRateController = TextEditingController();


  RxString selectedGender = AppConstants.genderTypes[0].obs;
  Future changeSelectedGender(String selected) async {
    selectedGender.value=selected;
    genderController.text=selected;
    change(true, status: RxStatus.success());
  }

  RxString selectedTarget = AppConstants.targetTypes[0].obs;
  Future changeSelectedTarget(String selected) async {
    selectedTarget.value=selected;
    targetController.text=selected;
    change(true, status: RxStatus.success());
  }

  RxString selectedActiveRate = AppConstants.activeRateTypes[0].obs;
  Future changeSelectedActiveRate(String selected) async {
    selectedActiveRate.value=selected;
    activeRateController.text=selected;
    change(true, status: RxStatus.success());
  }

  Rxn<String> heightError=Rxn<String>();
  Rxn<String> weightError=Rxn<String>();
  Rxn<String> genderError=Rxn<String>();
  Rxn<String> ageError=Rxn<String>();
  Rxn<String> targetError=Rxn<String>();
  Rxn<String> activeRateError=Rxn<String>();

  RxInt selectedprotien= 170.obs;
  RxInt selectedCarb= 170.obs;
  RxInt selectedFats= 170.obs;


  void selectProtienOnScroll(){
    protienPositionsListener.itemPositions.addListener((){

      selectedprotien.value= protienPositionsListener.itemPositions.value.first.index+1;
    });
  }

  void selectCarbOnScroll(){
    carbPositionsListener.itemPositions.addListener((){

      selectedCarb.value= carbPositionsListener.itemPositions.value.first.index+1;
    });
  }

  void selectFatsOnScroll(){
    fatsPositionsListener.itemPositions.addListener((){
      selectedFats.value= fatsPositionsListener.itemPositions.value.first.index+1;
    });
  }

  Future changeSelectedProtein(int selected,{bool? notUpdate}) async {
    selectedprotien.value=selected;
    protienScrollController.scrollTo(duration: Duration(milliseconds: 50),index:selectedprotien.value==0.0?selectedprotien.value: selectedprotien.value-1);
    change(notUpdate??true, status: RxStatus.success());
  }

  Future changeSelectedCarb(int selected,{bool? notUpdate}) async {
    selectedCarb.value=selected;
    carpScrollController.scrollTo(duration: Duration(milliseconds: 50),index:selectedCarb.value==0.0?selectedCarb.value: selectedCarb.value-1);

    change(notUpdate??true, status: RxStatus.success());
  }

  Future changeSelectedFats(int selected,{bool? notUpdate}) async {
    selectedFats.value=selected;
    fatsScrollController.scrollTo(duration: Duration(milliseconds: 50),index:selectedFats.value==0.0?selectedFats.value: selectedFats.value-1);

    change(notUpdate??true, status: RxStatus.success());
  }


  changeTotalCalories({String? operation,bool? notUpdate}){
    if(operation=="add") selectedTotalCalories.value=selectedTotalCalories.value+50;
    else if(operation=="min"&&selectedTotalCalories>50) selectedTotalCalories.value=selectedTotalCalories.value-50;
    else selectedTotalCalories.value=int.parse(caloriesAddController.text);
    caloriesAddController.text=selectedTotalCalories.value.toString();
    change(notUpdate??true, status: RxStatus.success());
  }

  double getPresentage(){
   return (((selectedprotien.value*4+selectedCarb.value*4+selectedFats.value*9)*100)/selectedTotalCalories.value).floorToDouble();
  }





  // {"name":"value","country":"value","calories":"value","carb":"value",
  // "protein":"value","fat":"value","height":"value","weight":"value",
  // "gender":"value","age":"value","goal":"value","allergy":"value",
  // "injury":"value","measurements":"value","workout_place":"value","workout_equipment":"value",
  // "workout_days":"value","cardio_days":"value"}
  Future updateUserCaloriesInfo(BuildContext context,{bool screenOfCalculateByPersonal=false}) async {
    if(screenOfCalculateByPersonal||getPresentage()==100){
      waiting.value=true;
      change(true, status: RxStatus.success());
      try {
        ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.updateTrainee,
          requestType: HttpRequestTypes.post,
          data: screenOfCalculateByPersonal?{
            "calories":selectedTotalCalories.value,
            "carb":selectedCarb.value,
            "protein":selectedprotien.value,
            "fat":selectedFats.value,
            "height":heightController.text,
            "weight":weightController.text,
            // "gender":selectedGender.value,
            "age":ageController.text,
            // "goal":selectedTarget.value,
          }:{
            "calories":selectedTotalCalories.value,
            "carb":selectedCarb.value,
            "protein":selectedprotien.value,
            "fat":selectedFats.value,
          },
        );

        if (response.statusCode == 200 && response.successFlag == true) {
          print("${AppApiConstants.updateTrainee}::oooo::${response.statusCode}::${response.successFlag}");
          HomeController  homeController= Get.put(HomeController());
          homeController.getUserInfo(context);
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


  Future calculateCaloriesByPersonalData(BuildContext context)async{
    if(_validatePersonalData()){
      UserPersonalInfoModel userPersonalInfoModel= UserPersonalInfoModel(
          activeRate:AppConstants.activeRateTypes.indexOf(selectedActiveRate.value) ,
          age: int.parse(ageController.text),
          height: int.parse(heightController.text),
          weight: int.parse(weightController.text),
          gender: selectedGender.value.tr=="male"?Gender.male:Gender.female,
          targetIndex: AppConstants.targetTypes.indexOf(selectedActiveRate.value),
      );
      CaloriesCalculatorModel caloriesCalculatorModel = CaloriesCalculatorService.caloriesCalculatorByUserInfo(userPersonalInfoModel);
      changeSelectedProtein(caloriesCalculatorModel.protein.toInt(),notUpdate: true);
      changeSelectedCarb(caloriesCalculatorModel.carb.toInt(),notUpdate: true);
      changeSelectedFats(caloriesCalculatorModel.fats.toInt(),notUpdate: true);
      selectedTotalCalories.value=caloriesCalculatorModel.calories.toInt();
      caloriesAddController.text=caloriesCalculatorModel.calories.toString();
      updateUserCaloriesInfo(context,screenOfCalculateByPersonal: true);
    }
    change(true, status: RxStatus.success());
  }

  bool _validatePersonalData() {

    heightError.value = AppValidatorService.validPositiveNumber(heightController.text,customMessage: "يجب أن تكون الطول رقم صحيح");
    weightError.value = AppValidatorService.validPositiveNumber(weightController.text,customMessage: "يجب أن تكون الوزن رقم صحيح");
    genderError.value = AppValidatorService.validNullable(genderController.text,customMessage: "يجب أن تختار نوعك");
    ageError.value = AppValidatorService.validPositiveNumber(ageController.text,customMessage: "يجب أن تكون العمر رقم صحيح");
    targetError.value = AppValidatorService.validNullable(targetController.text,customMessage: "يجب أن تختار هدفك");
    activeRateError.value = AppValidatorService.validNullable(activeRateController.text,customMessage: "يجب أن تختار معدل نشاطك");

    return heightError.value==null&& weightError.value==null&&genderError.value==null
        &&ageError.value==null&&targetError.value==null&&activeRateError.value==null;
  }


  @override
  void onInit() async {
    caloriesAddController= TextEditingController(text: selectedTotalCalories.value.toString());

    change(true, status: RxStatus.success());
   await Future.delayed(Duration(seconds: 1),(){
      changeSelectedProtein(170);
      changeSelectedFats(170);
      changeSelectedCarb(170);
    });

    Future.delayed(Duration(seconds: 2),(){

      selectProtienOnScroll();
      selectCarbOnScroll();
      selectFatsOnScroll();
      print("selectedItemIS::${selectedprotien.value}");
    });




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