import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/const/image_asset.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0EA5E9), Color(0xFF0284C7)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(ImageAsset.icon, width: 120, height: 120),
            const SizedBox(height: 32),
            // App Name
            const Text(
              'SCUBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            // Subtitle
            const Text(
              'Control & Monitoring System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Invisible Obx to trigger timer
            Obx(() {
              if (!controller.shouldNavigate.value) {
                controller.startTimer();
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
