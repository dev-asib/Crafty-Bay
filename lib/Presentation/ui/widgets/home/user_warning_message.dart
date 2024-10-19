import 'package:flutter/material.dart';

void unauthorizedWarningMessage({
  required BuildContext context,
  required VoidCallback onTap,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Center(child: Text("Warning!")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Now, You are an unauthorized user. You have to create your account and complete your profile.",
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onTap,
              child: const Text("Create Account"),
            ),
          ],
        ),
      );
    },
  );
}
