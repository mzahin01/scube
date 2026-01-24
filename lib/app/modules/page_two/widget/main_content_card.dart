import 'package:flutter/material.dart';
import '../controllers/page_two_controller.dart';
import 'main_tab_bar.dart';
import 'donut_chart.dart';
import 'source_load_tabs.dart';
import 'data_list_section.dart';
import '../../../shared/styles/colors.dart';

class MainContentCard extends StatelessWidget {
  final PageTwoController controller;

  const MainContentCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Column(
          children: [
            // Main Tabs
            MainTabBar(controller: controller),
            const SizedBox(height: 16),
            // Electricity Title
            const Text(
              'Electricity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: SGColors.secondaryText,
              ),
            ),
            const Divider(color: SGColors.whiteShade2, height: 24),
            // Donut Chart
            DonutChart(controller: controller),
            const SizedBox(height: 20),
            // Source/Load Tabs
            SourceLoadTabs(controller: controller),
            const SizedBox(height: 16),
            // Data List
            DataListSection(controller: controller),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
