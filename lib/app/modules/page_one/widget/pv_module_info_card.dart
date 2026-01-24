import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/const/image_asset.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class PVModuleInfoCard extends StatelessWidget {
  final PageOneController controller;

  const PVModuleInfoCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Header row
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: SGColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: SGColors.whiteShade2),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    ImageAsset.solarPanelBlue,
                    width: 18,
                    height: 18,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Total Num of PV Module',
                  style: TextStyle(fontSize: 12, color: SGColors.secondaryText),
                ),
                const Text(
                  ' :  ',
                  style: TextStyle(color: SGColors.secondaryText),
                ),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.totalPVModules.value,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: SGColors.deepBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Info rows
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.percentage,
                      backgroundColor: SGColors.blue.withAlpha(30),
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.server,
                      backgroundColor: SGColors.success.withAlpha(30),
                      label: 'Total DC Capacity',
                      value: controller.totalDcCapacity.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.calendar,
                      backgroundColor: SGColors.orange.withAlpha(30),
                      label: 'Date of Commissioning',
                      value: controller.dateOfCommissioning.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.globe,
                      backgroundColor: SGColors.purple.withAlpha(30),
                      label: 'Number of Inverter',
                      value: controller.numberOfInverters.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.blues7,
                      backgroundColor: SGColors.blue.withAlpha(30),
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: Obx(
                    () => InfoItem(
                      iconPath: ImageAsset.blues6,
                      backgroundColor: SGColors.success.withAlpha(30),
                      label: 'Total DC Capacity',
                      value: controller.totalDcCapacity.value,
                    ),
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

class InfoItem extends StatelessWidget {
  final String iconPath;
  final Color backgroundColor;
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.iconPath,
    required this.backgroundColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            // color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(iconPath, width: 16, height: 16),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: SGColors.secondaryText,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: SGColors.deepBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
