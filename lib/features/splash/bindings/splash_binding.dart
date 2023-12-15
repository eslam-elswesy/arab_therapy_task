import 'package:arab_therapy_task/features/user_controller.dart';
import 'package:arab_therapy_task/routes/app_pages.dart';
import 'package:get/get.dart';

import '../presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(UserController()).initialize(routeScreen: AppRoutes.splash);
  }
}
