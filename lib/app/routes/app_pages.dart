import 'package:get/get.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/page_one/bindings/page_one_binding.dart';
import '../modules/page_one/views/page_one_view.dart';
import '../modules/page_two/bindings/page_two_binding.dart';
import '../modules/page_two/views/page_two_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_ONE,
      page: () => const PageOneView(),
      binding: PageOneBinding(),
    ),
    GetPage(
      name: _Paths.PAGE_TWO,
      page: () => const PageTwoView(),
      binding: PageTwoBinding(),
    ),
  ];
}
