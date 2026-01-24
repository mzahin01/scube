import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/const/image_asset.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';
import 'stat_card.dart';

class StatsGrid extends StatelessWidget {
  final PageOneController controller;

  const StatsGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.liveAcPower,
                    iconColor: SGColors.blue,
                    value: controller.liveAcPower.value,
                    label: 'Live AC Power',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.plantGeneration,
                    iconColor: SGColors.yellow,
                    value: controller.plantGeneration.value,
                    label: 'Plant Generation',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.livePR,
                    iconColor: SGColors.success,
                    value: controller.livePR.value,
                    label: 'Live PR',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.cumulativePR,
                    iconColor: SGColors.purple,
                    value: controller.cumulativePR.value,
                    label: 'Cumulative PR',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.returnPV,
                    iconColor: SGColors.teal,
                    value: controller.returnPV.value,
                    label: 'Return PV(Till Today)',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    imagePath: ImageAsset.totalEnergyIcon,
                    iconColor: SGColors.cyan,
                    value: controller.totalEnergy.value,
                    label: 'Total Energy',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
