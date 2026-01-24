import 'package:flutter/material.dart';
import '../controllers/page_two_controller.dart';
import 'quick_action_button.dart';
import '../../../shared/styles/colors.dart';

class QuickActionsGrid extends StatelessWidget {
  final PageTwoController controller;

  const QuickActionsGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  icon: Icons.analytics_outlined,
                  iconColor: SGColors.purple,
                  label: 'Analysis Pro',
                  onTap: () => controller.onQuickActionTap('Analysis Pro'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  icon: Icons.electrical_services,
                  iconColor: SGColors.yellow,
                  label: 'G. Generator',
                  onTap: () => controller.onQuickActionTap('G. Generator'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  icon: Icons.flash_on,
                  iconColor: SGColors.orange,
                  label: 'Plant Summery',
                  onTap: () => controller.onQuickActionTap('Plant Summery'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  icon: Icons.local_fire_department,
                  iconColor: SGColors.red,
                  label: 'Natural Gas',
                  onTap: () => controller.onQuickActionTap('Natural Gas'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  icon: Icons.developer_board,
                  iconColor: SGColors.yellow,
                  label: 'D. Generator',
                  onTap: () => controller.onQuickActionTap('D. Generator'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  icon: Icons.water_drop,
                  iconColor: SGColors.blue,
                  label: 'Water Process',
                  onTap: () => controller.onQuickActionTap('Water Process'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
