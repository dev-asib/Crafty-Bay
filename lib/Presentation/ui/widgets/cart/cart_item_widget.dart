import 'package:crafty_bay/Presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/Presentation/ui/widgets/quantity_counter.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title of Product",
                            style: textTheme.bodyLarge,
                          ),
                          _buildColorAndSize(textTheme)
                        ],
                      ),
                    ),
                    _buildDeletionButton(),
                  ],
                ),
                _buildPriceAndQuantityCounter(textTheme)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDeletionButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.delete,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AssetsPath.dummyImage,
        height: 80,
        width: 80,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget _buildColorAndSize(TextTheme textTheme) {
    return Wrap(
      spacing: 8,
      children: [
        Text(
          "Color: Red",
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        Text(
          "Size: XL",
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPriceAndQuantityCounter(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$1000",
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.themeColor,
          ),
        ),
        QuantityCounter(
          onIncrease: () {},
          onDecrease: () {},
        ),
      ],
    );
  }
}
