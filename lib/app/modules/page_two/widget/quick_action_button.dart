import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

class QuickActionButton extends StatelessWidget {
  final IconData? icon;
  final String svgIcon;
  final String label;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    this.icon,
    required this.svgIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: SGColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset(
                  svgIcon,
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: SGColors.blackShade2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
