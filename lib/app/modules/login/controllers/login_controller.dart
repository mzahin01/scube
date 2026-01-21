import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  void onLogin() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // Simulate login
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        Get.snackbar(
          'Success',
          'Login successful!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Navigate to home or dashboard
        // Get.offAllNamed(Routes.HOME);
      });
    }
  }

  void onForgotPassword() {
    Get.snackbar(
      'Info',
      'Forgot password feature coming soon',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void onRegister() {
    Get.snackbar(
      'Info',
      'Register feature coming soon',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}
