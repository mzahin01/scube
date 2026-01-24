import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class SourceLoadTabs extends StatelessWidget {
  final PageTwoController controller;

  const SourceLoadTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Container(
          height: 44,
          decoration: BoxDecoration(
            color: SGColors.whiteShade1,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(children: [_buildTab('Source', 0), _buildTab('Load', 1)]),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = controller.selectedSourceTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setSourceTab(index),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? SGColors.deepBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? SGColors.white : SGColors.secondaryText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
