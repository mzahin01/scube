import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class PVModuleInfoCard extends StatelessWidget {
  final PageOneController controller;

  const PVModuleInfoCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Column(
          children: [
            // Header row
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: SGColors.blue.withAlpha(30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.solar_power,
                    size: 18,
                    color: SGColors.blue,
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
            const SizedBox(height: 16),
            // Info rows
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.electrical_services,
                      iconColor: SGColors.blue,
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.battery_charging_full,
                      iconColor: SGColors.success,
                      label: 'Total DC Capacity',
                      value: controller.totalDcCapacity.value,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.calendar_today,
                      iconColor: SGColors.orange,
                      label: 'Date of Commissioning',
                      value: controller.dateOfCommissioning.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.developer_board,
                      iconColor: SGColors.purple,
                      label: 'Number of Inverter',
                      value: controller.numberOfInverters.value,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.electrical_services,
                      iconColor: SGColors.blue,
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      iconData: Icons.battery_charging_full,
                      iconColor: SGColors.success,
                      label: 'Total DC Capacity',
                      value: controller.totalDcCapacity.value,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.iconData,
    required this.iconColor,
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
          decoration: BoxDecoration(
            color: iconColor.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(iconData, size: 16, color: iconColor),
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
