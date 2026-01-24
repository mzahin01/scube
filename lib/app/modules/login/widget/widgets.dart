import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/login_controller.dart';

class UsernameField extends StatelessWidget {
  final LoginController controller;

  const UsernameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.usernameController,
      validator: controller.validateUsername,
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: const TextStyle(color: SGColors.blackShade3),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: SGColors.whiteShade3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: SGColors.whiteShade3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: SGColors.blue),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final LoginController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller.passwordController,
        validator: controller.validatePassword,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(color: SGColors.blackShade3),
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: SGColors.whiteShade3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: SGColors.whiteShade3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: SGColors.blue),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: SGColors.blackShade2,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  final LoginController controller;

  const ForgotPasswordButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: controller.onForgotPassword,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: SGColors.blue,
            fontSize: 13,
            decoration: TextDecoration.underline,
            decorationColor: SGColors.blue,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final LoginController controller;

  const LoginButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: controller.isLoading.value ? null : controller.onLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: SGColors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBackgroundColor: SGColors.blue.withAlpha(153),
          elevation: 0,
        ),
        child: controller.isLoading.value
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(SGColors.white),
                ),
              )
            : const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: SGColors.white,
                ),
              ),
      ),
    );
  }
}

class RegisterLink extends StatelessWidget {
  final LoginController controller;

  const RegisterLink({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have any account? ",
          style: TextStyle(color: SGColors.secondaryText, fontSize: 13),
        ),
        GestureDetector(
          onTap: controller.onRegister,
          child: const Text(
            'Register Now',
            style: TextStyle(
              color: SGColors.blue,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
