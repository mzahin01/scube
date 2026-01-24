import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/login_controller.dart';
import '../widget/background.dart';
import '../widget/login_modal.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SGColors.blue,
      body: Stack(
        children: [
          const Background(),
          LoginModal(controller: controller),
        ],
      ),
    );
  }
}
