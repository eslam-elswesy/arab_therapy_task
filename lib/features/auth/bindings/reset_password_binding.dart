import 'package:get/get.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/reset_password_controller.dart';


class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestPasswordController(token: Get.parameters['token']??""));
  }
}