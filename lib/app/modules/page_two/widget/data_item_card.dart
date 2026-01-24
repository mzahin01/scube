import 'package:flutter/material.dart';
import '../../../shared/const/image_asset.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_two_controller.dart';

class DataItemCard extends StatelessWidget {
  final DataItem item;
  final VoidCallback onTap;

  const DataItemCard({super.key, required this.item, required this.onTap});

  String _getImageForType(DataIconType type) {
    switch (type) {
      case DataIconType.solarPanel:
        return ImageAsset.solarPanel;
      case DataIconType.battery:
        return ImageAsset.battery;
      case DataIconType.transmissionTower:
        return ImageAsset.transmissionTower;
      case DataIconType.windTurbine:
        return ImageAsset.solarPanel;
      case DataIconType.factory:
        return ImageAsset.transmissionTower;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: SGColors.blueShade1.withAlpha(100),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SGColors.whiteShade2),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: SGColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: SGColors.whiteShade2),
              ),
              child: Image.asset(
                _getImageForType(item.iconType),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          color: item.iconColor == DataIconColor.blue
                              ? SGColors.blue
                              : SGColors.orange,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: SGColors.deepBlue,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.isActive ? '(Active)' : '(Inactive)',
                        style: TextStyle(
                          fontSize: 12,
                          color: item.isActive
                              ? SGColors.active
                              : SGColors.inactive,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'Data 1',
                        style: TextStyle(
                          fontSize: 11,
                          color: SGColors.secondaryText.withAlpha(180),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ':  ${item.data1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: SGColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Data 2',
                        style: TextStyle(
                          fontSize: 11,
                          color: SGColors.secondaryText.withAlpha(180),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ':  ${item.data2}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: SGColors.deepBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: SGColors.secondaryText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
