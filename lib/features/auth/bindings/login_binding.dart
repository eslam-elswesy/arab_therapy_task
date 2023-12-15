
import 'package:get/get.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
