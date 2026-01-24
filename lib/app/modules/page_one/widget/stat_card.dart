import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

class StatCard extends StatelessWidget {
  final String imagePath;
  final Color iconColor;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.imagePath,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: SGColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SGColors.whiteShade2),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: iconColor.withAlpha(0),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              imagePath,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: SGColors.deepBlue,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: SGColors.secondaryText,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
