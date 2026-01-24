import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page_one_controller.dart';
import 'inverter_card.dart';

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
