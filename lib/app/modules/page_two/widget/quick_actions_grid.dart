import 'package:flutter/material.dart';
import 'package:scube/app/shared/const/image_asset.dart';
import '../controllers/page_two_controller.dart';
import 'quick_action_button.dart';

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
                  svgIcon: ImageAsset.chart,
                  label: 'Analysis Pro',
                  onTap: () => controller.onQuickActionTap('Analysis Pro'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  svgIcon: ImageAsset.generator1,
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
                  svgIcon: ImageAsset.charge,
                  label: 'Plant Summery',
                  onTap: () => controller.onQuickActionTap('Plant Summery'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  svgIcon: ImageAsset.fire,
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
                  svgIcon: ImageAsset.generator2,
                  label: 'D. Generator',
                  onTap: () => controller.onQuickActionTap('D. Generator'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionButton(
                  svgIcon: ImageAsset.faucet,
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
