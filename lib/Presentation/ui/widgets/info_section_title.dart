import 'package:flutter/material.dart';

class InfoSectionHeader extends StatelessWidget {
  const InfoSectionHeader({
    super.key,
    required this.title,
  });

 final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
