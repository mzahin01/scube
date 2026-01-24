import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/const/image_asset.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/splash_controller.dart';

class SplashBackground extends StatelessWidget {
  final SplashController controller;

  const SplashBackground({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: SGColors.blue,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const SplashLogo(),
          const SizedBox(height: 24),
          const SplashTitle(),
          const SizedBox(height: 8),
          const SplashSubtitle(),
          Obx(() {
            if (!controller.shouldNavigate.value) {
              controller.startTimer();
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAsset.icon, width: 120, height: 120);
  }
}

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'SCUBE',
      style: TextStyle(
        color: SGColors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    );
  }
}

class SplashSubtitle extends StatelessWidget {
  const SplashSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Control & Monitoring System',
      style: TextStyle(
        color: SGColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
