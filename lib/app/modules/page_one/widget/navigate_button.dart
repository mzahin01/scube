import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class NavigateButton extends StatelessWidget {
  final PageOneController controller;

  const NavigateButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: controller.onNavigateToSecondPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: SGColors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2nd Page Navigate',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: SGColors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.chevron_right, size: 20, color: SGColors.white),
            ],
          ),
        ),
      ),
    );
  }
}
