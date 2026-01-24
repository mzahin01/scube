import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class PageTwoAppBar extends StatelessWidget {
  final PageTwoController controller;

  const PageTwoAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: controller.onBackTap,
            child: const Icon(
              Icons.arrow_back,
              color: SGColors.black,
              size: 24,
            ),
          ),
          const Expanded(
            child: Text(
              '2nd Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: SGColors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.onNotificationTap,
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: SGColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: SGColors.whiteShade2),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: SGColors.blue,
                    size: 22,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: SGColors.red,
                      shape: BoxShape.circle,
                    ),
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

class NavigateButton extends StatelessWidget {
  final PageTwoController controller;

  const NavigateButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: controller.onNavigateToFirstPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: SGColors.skyBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1st Page Navigate',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: SGColors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.chevron_right, size: 20, color: SGColors.white),
            ],
          ),
        ),
      ),
    );
  }
}

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
            color: isSelected ? SGColors.deepBlue : SGColors.white,
            borderRadius: BorderRadius.only(
              topLeft: isFirst ? const Radius.circular(16) : Radius.zero,
              topRight: isLast ? const Radius.circular(16) : Radius.zero,
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

class DonutChart extends StatelessWidget {
  final PageTwoController controller;

  const DonutChart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Donut ring
          CustomPaint(size: const Size(180, 180), painter: DonutChartPainter()),
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

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 24.0;

    // Background arc (light blue)
    final bgPaint = Paint()
      ..color = SGColors.skyBlue.withAlpha(80)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - strokeWidth / 2, bgPaint);

    // Foreground arc (gradient effect with solid blue)
    final fgPaint = Paint()
      ..color = SGColors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw ~75% of circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -math.pi / 2, // Start from top
      math.pi * 1.5, // 75% of circle
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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

class DataListSection extends StatelessWidget {
  final PageTwoController controller;

  const DataListSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Obx(
        () => Column(
          children: controller.dataList
              .map(
                (item) => DataItemCard(
                  item: item,
                  onTap: () => controller.onDataItemTap(item),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class DataItemCard extends StatelessWidget {
  final DataItem item;
  final VoidCallback onTap;

  const DataItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: SGColors.blueShade1.withAlpha(100),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: SGColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: SGColors.whiteShade2),
              ),
              child: Icon(
                Icons.solar_power,
                size: 24,
                color: item.iconColor == DataIconColor.blue
                    ? SGColors.blue
                    : SGColors.orange,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: item.iconColor == DataIconColor.blue
                              ? SGColors.blue
                              : SGColors.orange,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: SGColors.deepBlue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.isActive ? '(Active)' : '(Inactive)',
                        style: TextStyle(
                          fontSize: 12,
                          color: item.isActive
                              ? SGColors.active
                              : SGColors.inactive,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'Data 1',
                        style: TextStyle(
                          fontSize: 11,
                          color: SGColors.secondaryText.withAlpha(180),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ':  ${item.data1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: SGColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Data 2',
                        style: TextStyle(
                          fontSize: 11,
                          color: SGColors.secondaryText.withAlpha(180),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ':  ${item.data2}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: SGColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: SGColors.secondaryText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

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

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withAlpha(30),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: SGColors.deepBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
