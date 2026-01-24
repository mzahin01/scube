import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';
import '../widget/widgets.dart';

class PageTwoView extends GetView<PageTwoController> {
  const PageTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SGColors.whiteShade1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar
              PageTwoAppBar(controller: controller),
              const SizedBox(height: 8),
              // Navigate Button
              NavigateButton(controller: controller),
              // Main Content Card with tabs, chart, data
              MainContentCard(controller: controller),
              // Quick Actions Grid
              QuickActionsGrid(controller: controller),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
