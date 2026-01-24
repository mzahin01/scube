import 'package:flutter/material.dart';
import 'package:scube/app/modules/login/widget/widgets.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/login_controller.dart';

class LoginModal extends StatefulWidget {
  final LoginController controller;

  const LoginModal({super.key, required this.controller});

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal>
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
            color: SGColors.white,
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
                      color: SGColors.black,
                    ),
                  ),
                  const SizedBox(height: 32),
                  UsernameField(controller: widget.controller),
                  const SizedBox(height: 16),
                  PasswordField(controller: widget.controller),
                  const SizedBox(height: 8),
                  ForgotPasswordButton(controller: widget.controller),
                  const SizedBox(height: 24),
                  LoginButton(controller: widget.controller),
                  const SizedBox(height: 20),
                  RegisterLink(controller: widget.controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
