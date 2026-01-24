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
  final PageOneController controller;

  const NavigateButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: controller.onNavigateToSecondPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: SGColors.blue,
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
                    iconData: Icons.flash_on,
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
                    iconData: Icons.wb_sunny_outlined,
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
                    iconData: Icons.speed,
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
                    iconData: Icons.trending_up,
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
                    iconData: Icons.attach_money,
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
                    iconData: Icons.bolt,
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

class StatCard extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SGColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SGColors.whiteShade2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SGColors.deepBlue,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 9, color: SGColors.secondaryText),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
            colors: [Color(0xFF64B5F6), Color(0xFF42A5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Temperature Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.moduleTemperature.value,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: SGColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Module\nTemperature',
                  style: TextStyle(
                    fontSize: 11,
                    color: SGColors.white,
                    height: 1.3,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            // Thermometer
            _buildThermometer(),
            const SizedBox(width: 16),
            // Right Section with weather info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Sun with clouds icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          const Icon(
                            Icons.wb_sunny,
                            size: 36,
                            color: Color(0xFFFFD54F),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.cloud,
                              size: 20,
                              color: SGColors.white.withAlpha(200),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      controller.windSpeed.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: SGColors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Wind Speed & Direction',
                    style: TextStyle(fontSize: 10, color: Color(0xFFE3F2FD)),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => Text(
                      controller.effectiveIrradiation.value,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: SGColors.white,
                      ),
                    ),
                  ),
                  const Text(
                    'Effective Irradiation',
                    style: TextStyle(fontSize: 10, color: Color(0xFFE3F2FD)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThermometer() {
    return Container(
      width: 50,
      height: 90,
      decoration: BoxDecoration(
        color: SGColors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Thermometer body
          Container(
            width: 16,
            height: 70,
            decoration: BoxDecoration(
              color: SGColors.white.withAlpha(80),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Thermometer fill
          Positioned(
            bottom: 15,
            child: Container(
              width: 12,
              height: 45,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEF5350), Color(0xFFFF8A65)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          // Thermometer bulb
          Positioned(
            bottom: 5,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Color(0xFFEF5350),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Scale marks
          Positioned(
            right: 8,
            top: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildScaleMark('45°c'),
                const SizedBox(height: 8),
                _buildScaleMark('30°c'),
                const SizedBox(height: 8),
                _buildScaleMark('15°c'),
                const SizedBox(height: 8),
                _buildScaleMark('0°c'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScaleMark(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 7,
        color: SGColors.white.withAlpha(200),
        fontWeight: FontWeight.w500,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: SGColors.whiteShade2),
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
            const Divider(height: 24, color: SGColors.whiteShade2),
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: SGColors.deepBlue,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: SGColors.success.withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 14,
                      color: SGColors.success,
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
          // Info rows
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.battery_full,
                  iconColor: SGColors.blue,
                  label: 'Lifetime Energy',
                  value: data.lifetimeEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.today,
                  iconColor: SGColors.orange,
                  label: 'Today Energy',
                  value: data.todayEnergy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.history,
                  iconColor: SGColors.red,
                  label: 'Prev. Meter Energy',
                  value: data.prevMeterEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.power,
                  iconColor: SGColors.teal,
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
  final IconData iconData;
  final Color iconColor;
  final String label;
  final String value;

  const InverterInfoItem({
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
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(iconData, size: 18, color: iconColor),
        ),
        const SizedBox(width: 10),
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
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
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

// ==================== INVERTER LIST ====================
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
