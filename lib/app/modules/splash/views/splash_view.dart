import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/splash_controller.dart';
import '../widget/splash_widgets.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SGColors.blue,
      body: SafeArea(child: SplashBackground(controller: controller)),
    );
  }
}
