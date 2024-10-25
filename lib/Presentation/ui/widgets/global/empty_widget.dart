import 'package:crafty_bay/Presentation/ui/utils/assets_paths/assets_paths.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
    this.imagePath = AssetsPaths.emptyCart,
  });

  final String message;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath!,
            width: 50,
          ),
          const SizedBox(height: 8),
          Text(message, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
