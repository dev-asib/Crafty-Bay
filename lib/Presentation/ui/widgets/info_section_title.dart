import 'package:flutter/material.dart';

class InfoSectionTitle extends StatelessWidget {
  const InfoSectionTitle({
    super.key,
    required this.textTheme,
    required this.title,
  });

  final TextStyle? textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: textTheme?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
