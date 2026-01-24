// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';
import 'data_item_card.dart';

class DataListSection extends StatelessWidget {
  final PageTwoController controller;

  const DataListSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: Obx(
              () => RawScrollbar(
                thumbColor: SGColors.blue,
                trackColor:
                    SGColors.blueShade1, // Matching screenshot track color
                trackVisibility: true,
                thumbVisibility: true,
                thickness: 6,
                radius: const Radius.circular(3),
                trackRadius: const Radius.circular(3),
                // Padding top and bottom to make the tracker height smaller
                padding: const EdgeInsets.only(right: 2, top: 20, bottom: 20),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.dataList.length,
                  padding: const EdgeInsets.only(
                    right: 14,
                  ), // Space for scrollbar
                  itemBuilder: (context, index) {
                    final item = controller.dataList[index];
                    return DataItemCard(
                      item: item,
                      onTap: () => controller.onDataItemTap(item),
                    );
                  },
                ),
              ),
            ),
          ),
          // Bottom gradient fade
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    SGColors.black.withOpacity(0.0),
                    SGColors.black.withOpacity(0.2),
                    SGColors.black.withOpacity(0.3),
                    SGColors.black.withOpacity(0.5),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
