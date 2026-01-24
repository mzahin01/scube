import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

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
