import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../widget/background.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF42A5F5),
      body: Stack(
        children: [
          // Blue background with logo
          Background(),
          // White modal bottom sheet
          _LoginModal(controller: controller),
        ],
      ),
    );
  }
}

class _LoginModal extends StatefulWidget {
  final LoginController controller;

  const _LoginModal({required this.controller});

  @override
  State<_LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<_LoginModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Start animation after 0.5 seconds
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: widget.controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Username Field
                  TextFormField(
                    controller: widget.controller.usernameController,
                    validator: widget.controller.validateUsername,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF42A5F5)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Field
                  Obx(
                    () => TextFormField(
                      controller: widget.controller.passwordController,
                      validator: widget.controller.validatePassword,
                      obscureText: !widget.controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF42A5F5),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            widget.controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey[500],
                          ),
                          onPressed: widget.controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: widget.controller.onForgotPassword,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(
                          color: Color(0xFF42A5F5),
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF42A5F5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  Obx(
                    () => ElevatedButton(
                      onPressed: widget.controller.isLoading.value
                          ? null
                          : widget.controller.onLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF42A5F5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBackgroundColor: const Color(
                          0xFF42A5F5,
                        ).withAlpha(153),
                        elevation: 0,
                      ),
                      child: widget.controller.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Register Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any account? ",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.controller.onRegister,
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Color(0xFF42A5F5),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
