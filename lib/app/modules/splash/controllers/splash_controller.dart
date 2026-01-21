import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final shouldNavigate = false.obs;

  void startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      shouldNavigate.value = true;
      Get.offNamed(Routes.LOGIN);
    });
  }
}
