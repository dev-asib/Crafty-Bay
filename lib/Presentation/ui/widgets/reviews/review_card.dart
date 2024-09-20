import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.userName,
    required this.reviewText,
  });

  final String userName;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      elevation: 2,
      child: ListTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              userName,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        subtitle: Text(
          reviewText,
          style: textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
