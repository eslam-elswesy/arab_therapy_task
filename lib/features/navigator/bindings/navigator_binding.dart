import 'package:get/get.dart';
import 'package:arab_therapy_task/features/account/presentation/controllers/account_controller.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/meals_controller.dart';
import 'package:arab_therapy_task/features/navigator/presentation/controllers/navigator_controller.dart';
import 'package:arab_therapy_task/features/tadreab/presentation/controllers/tadreab_controller.dart';
import 'package:arab_therapy_task/features/traning/presentation/controllers/training_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigatorController());
    Get.put(HomeController());
    Get.put(TrainingController());
    Get.put(TadreabController());
    Get.put(MealsController());
    Get.put(AccountController());
  }
}