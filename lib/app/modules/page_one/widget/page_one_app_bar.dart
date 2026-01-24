import 'package:flutter/material.dart';
import '../../../shared/const/image_asset.dart';
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
          Image.asset(ImageAsset.bell, width: 25, height: 25),
        ],
      ),
    );
  }
}
