
import 'package:arab_therapy_task/features/home/bindings/start_now_binding.dart';
import 'package:arab_therapy_task/features/home/presentation/views/start_now_view.dart';
import 'package:get/get.dart';
import 'package:arab_therapy_task/features/home/bindings/home_binding.dart';
import 'package:arab_therapy_task/features/home/presentation/views/home_view.dart';
import 'package:arab_therapy_task/features/splash/bindings/splash_binding.dart';
import 'package:arab_therapy_task/features/splash/presentation/views/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.startNow,
      page: () => const StartNowView(),
      binding: StartNowBinding(),
    ),
  ];
}
