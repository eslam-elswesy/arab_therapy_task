
import 'package:arab_therapy_task/features/home/presentation/controllers/start_now_controller.dart';
import 'package:get/get.dart';


class StartNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StartNowController());
  }
}
