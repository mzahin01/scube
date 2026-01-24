import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class MainTabBar extends StatelessWidget {
  final PageTwoController controller;

  const MainTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            _buildTab('Summery', 0, isFirst: true),
            _buildTab('SLD', 1),
            _buildTab('Data', 2, isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    String label,
    int index, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    final isSelected = controller.selectedMainTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setMainTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? SGColors.blue : SGColors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? SGColors.white : SGColors.secondaryText,
            ),
          ),
        ),
      ),
    );
  }
}
