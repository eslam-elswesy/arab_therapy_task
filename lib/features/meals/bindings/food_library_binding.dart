import 'package:get/get.dart';
import 'package:arab_therapy_task/features/meals/presentation/controllers/food_library_controller.dart';


class FoodLibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoodLibraryController());
  }
}