
import 'package:get/get.dart';
import 'package:arab_therapy_task/features/auth/bindings/forget_password_binding.dart';
import 'package:arab_therapy_task/features/auth/bindings/login_binding.dart';
import 'package:arab_therapy_task/features/auth/bindings/reset_password_binding.dart';
import 'package:arab_therapy_task/features/auth/bindings/signup_binding.dart';
import 'package:arab_therapy_task/features/auth/bindings/verification_binding.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/forget_password_view.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/login_view.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/reset_password_view.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/signup_view.dart';
import 'package:arab_therapy_task/features/auth/presentation/views/verification_view.dart';
import 'package:arab_therapy_task/features/meals/bindings/food_library_binding.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/calculate_calories_by_personal_info_view.dart';
import 'package:arab_therapy_task/features/meals/presentation/view/food_library_view.dart';
import 'package:arab_therapy_task/features/navigator/bindings/navigator_binding.dart';
import 'package:arab_therapy_task/features/navigator/presentation/view/navigator_view.dart';
import 'package:arab_therapy_task/features/intro/bindings/intro_binding.dart';
import 'package:arab_therapy_task/features/intro/presentation/views/intro_view.dart';
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
      name: AppRoutes.intro,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.restPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.navigator,
      page: () => NavigatorView(),
      binding: NavigatorBinding(),
    ),
    GetPage(
      name: AppRoutes.calculateCaloriesByPersonalInfo,
      page: () => CalculateCaloriesByPersonalInfo(),
      // binding: NavigatorBinding(),
    ),
    GetPage(
      name: AppRoutes.foodLibrary,
      page: () => FoodLibraryView(),
      binding: FoodLibraryBinding(),
    ),
  ];
}
