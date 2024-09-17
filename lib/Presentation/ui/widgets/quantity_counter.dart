import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    super.key,
    this.quantity = 1, required this.onIncrease, required this.onDecrease,
  });

  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(Icons.remove, onDecrease),
        Text(
          "$quantity",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        _buildIconButton(Icons.add, onIncrease),
      ],
    );
  }

  Widget _buildIconButton(IconData iconData, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
