import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../shared/styles/colors.dart';
import 'widgets/splash_screen_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(2000.milliseconds, () async {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return SplashScreenView(
      imageSize: 200,
      speed: 30,
      imageSrc: 'assets/icon/icon.jpeg',
      text: 'Learning that Breathes.\nProgress that Plays.',
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontFamily: 'SairaStencilOne',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: SGColors.deepBlue,
      ),
      backgroundColor: SGColors.white,
    );
  }
}
