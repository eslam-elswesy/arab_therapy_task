import 'package:get/get.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/forget_password_controller.dart';


class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgetPasswordController());
  }
}