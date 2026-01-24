import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class DataComparisonTable extends StatelessWidget {
  final PageOneController controller;

  const DataComparisonTable({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: SGColors.blueShade1,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Header
            const Row(
              children: [
                Expanded(flex: 3, child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Yesterday's Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: SGColors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Today's Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: SGColors.black,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24, color: SGColors.whiteShade3),
            Obx(
              () => DataRowWidget(
                label: 'AC Max Power',
                yesterday: controller.yesterdayAcMaxPower.value,
                today: controller.todayAcMaxPower.value,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DataRowWidget(
                label: 'Net Energy',
                yesterday: controller.yesterdayNetEnergy.value,
                today: controller.todayNetEnergy.value,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DataRowWidget(
                label: 'Specific Yield',
                yesterday: controller.yesterdaySpecificYield.value,
                today: controller.todaySpecificYield.value,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DataRowWidget(
                label: 'Net Energy',
                yesterday: controller.yesterdayNetEnergy.value,
                today: controller.todayNetEnergy.value,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => DataRowWidget(
                label: 'Specific Yield',
                yesterday: controller.yesterdaySpecificYield.value,
                today: controller.todaySpecificYield.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataRowWidget extends StatelessWidget {
  final String label;
  final String yesterday;
  final String today;

  const DataRowWidget({
    super.key,
    required this.label,
    required this.yesterday,
    required this.today,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: SGColors.secondaryText),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            yesterday,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: SGColors.deepBlue,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            today,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: SGColors.deepBlue,
            ),
          ),
        ),
      ],
    );
  }
}
