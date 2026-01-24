import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';
import '../widget/widgets.dart';

class PageOneView extends GetView<PageOneController> {
  const PageOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SGColors.whiteShade1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageOneAppBar(controller: controller),
              const SizedBox(height: 8),
              NavigateButton(controller: controller),
              StatsGrid(controller: controller),
              WeatherCard(controller: controller),
              DataComparisonTable(controller: controller),
              PVModuleInfoCard(controller: controller),
              const SizedBox(height: 16),
              InverterList(controller: controller),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
