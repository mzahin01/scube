// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class DonutChart extends StatelessWidget {
  final PageTwoController controller;

  const DonutChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pie Chart using fl_chart
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 75,
              startDegreeOffset: -90,
              sections: [
                PieChartSectionData(
                  color: SGColors.blue,
                  value: 75,
                  title: '',
                  radius: 30,
                ),
                PieChartSectionData(
                  color: SGColors.skyBlue.withAlpha(80),
                  value: 25,
                  title: '',
                  radius: 30,
                ),
              ],
            ),
          ),
          // Center text
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total Power',
                  style: TextStyle(fontSize: 12, color: SGColors.secondaryText),
                ),
                const SizedBox(height: 4),
                Text(
                  controller.totalPower.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: SGColors.deepBlue,
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
