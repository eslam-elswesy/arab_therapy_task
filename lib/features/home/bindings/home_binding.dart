
import 'package:get/get.dart';
import 'package:arab_therapy_task/features/home/presentation/controllers/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
