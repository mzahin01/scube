import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';
import '../controllers/page_one_controller.dart';

class InverterCard extends StatelessWidget {
  final InverterData data;

  const InverterCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SGColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SGColors.whiteShade2),
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: SGColors.deepBlue,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: SGColors.success.withAlpha(30),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 14,
                      color: SGColors.success,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    data.status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: SGColors.success,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Info rows
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.battery_full,
                  iconColor: SGColors.blue,
                  label: 'Lifetime Energy',
                  value: data.lifetimeEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.today,
                  iconColor: SGColors.orange,
                  label: 'Today Energy',
                  value: data.todayEnergy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.history,
                  iconColor: SGColors.red,
                  label: 'Prev. Meter Energy',
                  value: data.prevMeterEnergy,
                ),
              ),
              Expanded(
                child: InverterInfoItem(
                  iconData: Icons.power,
                  iconColor: SGColors.teal,
                  label: 'Live Power',
                  value: data.livePower,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InverterInfoItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String label;
  final String value;

  const InverterInfoItem({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: iconColor.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(iconData, size: 18, color: iconColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  color: SGColors.secondaryText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: SGColors.deepBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
