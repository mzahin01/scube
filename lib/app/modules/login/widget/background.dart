import 'package:flutter/material.dart';
import '../../../shared/const/image_asset.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF42A5F5),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Logo
            Image.asset(ImageAsset.icon, width: 120, height: 120),
            const SizedBox(height: 24),
            // Title
            const Text(
              'SCUBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Control & Monitoring System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
