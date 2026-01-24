import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class PageOneAppBar extends StatelessWidget {
  final PageOneController controller;

  const PageOneAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: controller.onBackTap,
            child: const Icon(Icons.arrow_back, color: SGColors.black),
          ),
          const Expanded(
            child: Text(
              '1st Page',
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
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: SGColors.whiteShade1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: SGColors.blue,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigateButton extends StatelessWidget {
  final PageOneController controller;

  const NavigateButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: controller.onNavigateToSecondPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: SGColors.blue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '2nd Page Navigate',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: SGColors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, size: 14, color: SGColors.white),
          ],
        ),
      ),
    );
  }
}

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
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.blue.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    value: controller.liveAcPower.value,
                    label: 'Live AC Power',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.yellow.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    value: controller.plantGeneration.value,
                    label: 'Plant Generation',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.green.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
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
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.purple.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    value: controller.cumulativePR.value,
                    label: 'Cumulative PR',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.teal.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    value: controller.returnPV.value,
                    label: 'Return PV(Till Today)',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Obx(
                  () => StatCard(
                    icon: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: SGColors.cyan.withAlpha(50),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
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

class StatCard extends StatelessWidget {
  final Widget icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SGColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SGColors.whiteShade2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SGColors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: SGColors.secondaryText),
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final PageOneController controller;

  const WeatherCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.moduleTemperature.value,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: SGColors.white,
                    ),
                  ),
                ),
                const Text(
                  'Module\nTemperature',
                  style: TextStyle(fontSize: 12, color: SGColors.white),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Thermometer placeholder
            Container(
              width: 40,
              height: 80,
              decoration: BoxDecoration(
                color: SGColors.white.withAlpha(50),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sun icon placeholder
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: SGColors.yellow.withAlpha(100),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.windSpeed.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: SGColors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Wind Speed & Direction',
                    style: TextStyle(fontSize: 10, color: SGColors.white),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.effectiveIrradiation.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: SGColors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Effective Irradiation',
                    style: TextStyle(fontSize: 10, color: SGColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataComparisonTable extends StatelessWidget {
  final PageOneController controller;

  const DataComparisonTable({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 2,
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
                  flex: 2,
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
            const Divider(height: 24),
            Obx(
              () => DataRow(
                label: 'AC Max Power',
                yesterday: controller.yesterdayAcMaxPower.value,
                today: controller.todayAcMaxPower.value,
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DataRow(
                label: 'Net Energy',
                yesterday: controller.yesterdayNetEnergy.value,
                today: controller.todayNetEnergy.value,
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DataRow(
                label: 'Specific Yield',
                yesterday: controller.yesterdaySpecificYield.value,
                today: controller.todaySpecificYield.value,
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DataRow(
                label: 'Net Energy',
                yesterday: controller.yesterdayNetEnergy.value,
                today: controller.todayNetEnergy.value,
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DataRow(
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

class DataRow extends StatelessWidget {
  final String label;
  final String yesterday;
  final String today;

  const DataRow({
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
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: SGColors.secondaryText),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            yesterday,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: SGColors.black,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            today,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: SGColors.black,
            ),
          ),
        ),
      ],
    );
  }
}

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
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: SGColors.blue.withAlpha(30),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Total Num of PV Module',
                  style: TextStyle(fontSize: 12, color: SGColors.secondaryText),
                ),
                const Text(
                  ' : ',
                  style: TextStyle(color: SGColors.secondaryText),
                ),
                Obx(
                  () => Text(
                    controller.totalPVModules.value,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: SGColors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.blue,
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.green,
                      label: 'Total DC Capacity',
                      value: controller.totalDcCapacity.value,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.orange,
                      label: 'Date of Commissioning',
                      value: controller.dateOfCommissioning.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.purple,
                      label: 'Number of Inverter',
                      value: controller.numberOfInverters.value,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.blue,
                      label: 'Total AC Capacity',
                      value: controller.totalAcCapacity.value,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => InfoItem(
                      icon: SGColors.green,
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
  final Color icon;
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: icon.withAlpha(30),
            borderRadius: BorderRadius.circular(6),
          ),
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: SGColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InverterCard extends StatelessWidget {
  final InverterData data;

  const InverterCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SGColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SGColors.whiteShade2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: SGColors.black,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: SGColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    data.status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: SGColors.success,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  icon: SGColors.blue,
                  label: 'Lifetime Energy',
                  value: data.lifetimeEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  icon: SGColors.green,
                  label: 'Today Energy',
                  value: data.todayEnergy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  icon: SGColors.orange,
                  label: 'Prev. Meter Energy',
                  value: data.prevMeterEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  icon: SGColors.purple,
                  label: 'Live Power',
                  value: data.livePower,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InverterInfoItem extends StatelessWidget {
  final Color icon;
  final String label;
  final String value;

  const InverterInfoItem({
    super.key,
    required this.icon,
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
            color: icon.withAlpha(30),
            borderRadius: BorderRadius.circular(6),
          ),
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
                  color: SGColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InverterList extends StatelessWidget {
  final PageOneController controller;

  const InverterList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => Column(
          children: controller.inverterList
              .map((data) => InverterCard(data: data))
              .toList(),
        ),
      ),
    );
  }
}
