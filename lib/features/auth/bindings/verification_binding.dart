import 'package:get/get.dart';
import 'package:arab_therapy_task/features/auth/presentation/controllers/verification_controller.dart';


class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VerificationController(token: Get.parameters['token']??"",type: Get.parameters['type']??"",content: Get.parameters['content']??""));
  }
}