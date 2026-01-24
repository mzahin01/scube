import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class PageTwoAppBar extends StatelessWidget {
  final PageTwoController controller;

  const PageTwoAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: controller.onBackTap,
            child: const Icon(
              Icons.arrow_back,
              color: SGColors.black,
              size: 24,
            ),
          ),
          const Expanded(
            child: Text(
              '2nd Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: SGColors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.onNotificationTap,
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: SGColors.blue,
                    size: 22,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: SGColors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
