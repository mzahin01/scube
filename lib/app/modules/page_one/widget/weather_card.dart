import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/const/image_asset.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class WeatherCard extends StatelessWidget {
  final PageOneController controller;

  const WeatherCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2E63F7), Color(0xFFB982D9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Temperature Section
            Container(
              // height: 160,
              // width: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: SGColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller.moduleTemperature.value,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: SGColors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Module\nTemperature',
                        style: TextStyle(
                          fontSize: 10,
                          color: SGColors.secondaryText,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(width: 8),
                  // Thermometer
                  Image.asset(
                    'assets/pngs/thermo.png',
                    width: 48,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            // Right Section with weather info
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 24,
                  bottom: 24,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFE3F2FD),
                            ),
                          ),
                          const SizedBox(height: 16),
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
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFE3F2FD),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Weather icon
                    Image.asset(
                      ImageAsset.cloude,
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
